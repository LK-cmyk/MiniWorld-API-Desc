import * as fs from 'fs';
import * as path from 'path';
import * as vscode from 'vscode';

import { COMPLETION_MODE_SETTING, getCompletionMode, type CompletionMode } from './completionMode';

/** 事件定义文件 */
const EVENT_DEFINITIONS_FILE_20 = path.join('declarations', '2.0', 'MNEvent.d.json');
const EVENT_DEFINITIONS_FILE_30 = path.join('declarations', '3.0', 'MNEvent.d.lua');

/** 3.0 模式支持的事件枚举类 */
const EVENT_CLASSES_30 = ['TriggerEvent', 'ObjectEvent'] as const;
type EventClass30 = typeof EVENT_CLASSES_30[number];

export type EventDefinition = {
    desc?: string;
    event_info?: Record<string, string>;
};

/** 事件补全的会话状态，集中管理避免散落的模块级变量 */
type CompletionState = {
    mode: CompletionMode;
    ready: boolean;
    definitions: Map<string, EventDefinition>;
    /** 2.0 模式的完整补全项缓存 */
    flatItems: vscode.CompletionItem[] | null;
    /** 3.0 模式按类名缓存的补全项 */
    classItems: Map<EventClass30, vscode.CompletionItem[]>;
};

const state: CompletionState = {
    mode: '2.0',
    ready: false,
    definitions: new Map(),
    flatItems: null,
    classItems: new Map(),
};

let loadSeq = 0;

function getEventDefinitionsFile(context: vscode.ExtensionContext, mode: '2.0' | '3.0'): string {
    const rel = mode === '3.0' ? EVENT_DEFINITIONS_FILE_30 : EVENT_DEFINITIONS_FILE_20;
    const bundled = path.resolve(context.extensionPath, rel);
    return fs.existsSync(bundled) ? bundled : path.resolve(context.extensionPath, '..', rel);
}

export async function parseEventDefinitions(filePath: string): Promise<Map<string, EventDefinition>> {
    try {
        const raw = await fs.promises.readFile(filePath, 'utf8');
        const parsed = JSON.parse(raw) as Record<string, EventDefinition>;
        return sortEntries(Object.entries(parsed));
    } catch (error) {
        console.warn(`读取事件补全文件失败: ${filePath}`, error);
        return new Map();
    }
}

/** 解析 3.0 MNEvent.d.lua 中的 LuaDoc 事件定义。 */
export async function parseLuaEventDefinitions(filePath: string): Promise<Map<string, EventDefinition>> {
    try {
        const raw = await fs.promises.readFile(filePath, 'utf8');
        return sortEntries(Array.from(parseLuaDefinitions(raw).entries()));
    } catch (error) {
        console.warn(`读取事件补全文件失败: ${filePath}`, error);
        return new Map();
    }
}

/** 将事件键按字典序排序，保证补全列表顺序稳定 */
function sortEntries(entries: [string, EventDefinition][]): Map<string, EventDefinition> {
    entries.sort(([left], [right]) => left.localeCompare(right));
    return new Map(entries);
}

/** 从 LuaDoc 源文本中提取以 `ClassName.fieldName` 为键的事件定义 */
function parseLuaDefinitions(raw: string): Map<string, EventDefinition> {
    const definitions = new Map<string, EventDefinition>();
    let currentClass: EventClass30 | null = null;

    const classRe = /^---\s+@class\s+(TriggerEvent|ObjectEvent)\b/;
    const fieldRe = /^---\s+@field\s+(\w+)\s+\S+\s+@(.+?)(?:\s+\{(.*)\})?\s*$/;

    for (const line of raw.split(/\r?\n/)) {
        const classMatch = classRe.exec(line);
        if (classMatch) {
            currentClass = classMatch[1] as EventClass30;
            continue;
        }

        const fieldMatch = fieldRe.exec(line);
        if (!currentClass || !fieldMatch) {
            continue;
        }

        const [, fieldName, desc, rawParams] = fieldMatch;
        const eventInfo = parseEventInfoParams(rawParams);
        definitions.set(`${currentClass}.${fieldName}`, {
            desc: desc.trim(),
            ...(Object.keys(eventInfo).length > 0 ? { event_info: eventInfo } : {}),
        });
    }

    return definitions;
}

/** 解析 LuaDoc `@field` 的 `{name:说明, x,y,z:说明}` 形式参数列表 */
function parseEventInfoParams(rawParams: string | undefined): Record<string, string> {
    const eventInfo: Record<string, string> = {};
    if (!rawParams) {
        return eventInfo;
    }

    // 参数形如 `blockid:方块类型, x,y,z:事件位置`；分组名共享同一个说明
    const paramRe = /([A-Za-z_]\w*(?:\s*,\s*[A-Za-z_]\w*)*)\s*:\s*([^,]*)/g;
    for (const match of rawParams.matchAll(paramRe)) {
        const value = match[2].trim();
        for (const name of match[1].split(',')) {
            const trimmed = name.trim();
            if (trimmed) {
                eventInfo[trimmed] = value;
            }
        }
    }
    return eventInfo;
}

/**
 * 从整份源码中反查某个命名回调注册到了哪些 3.0 事件。
 * 命名回调不参与 LuaLS 的泛型推断，这里通过 `AddEvent/AddTriggerEvent` 的第二个参数反向匹配。
 */
export function findEventKeysForFunction(source: string, functionName: string): string[] {
    const shortName = functionName.split(/[.:]/).pop();
    if (!shortName) {
        return [];
    }

    const regRe = /Add(?:Trigger)?Event\s*\(\s*(TriggerEvent|ObjectEvent)\.(\w+)\s*,\s*([\w.:]+)/g;
    const keys = new Set<string>();
    for (const match of source.matchAll(regRe)) {
        const refName = match[3].split(/[.:]/).pop();
        if (refName === shortName) {
            keys.add(`${match[1]}.${match[2]}`);
        }
    }
    return Array.from(keys);
}

/** 找到光标所在（最近的）命名函数及其参数名 */
function findEnclosingFunction(
    document: vscode.TextDocument,
    position: vscode.Position,
): { name: string; params: string[]; line: number } | null {
    for (let lineNo = position.line; lineNo >= 0; lineNo--) {
        const match = /^\s*(?:local\s+)?function\s+([\w.:]+)\s*\(([^)]*)\)/.exec(
            document.lineAt(lineNo).text,
        );
        if (!match) {
            continue;
        }
        const params = match[2].split(',').map(part => {
            const name = /^\s*([A-Za-z_]\w*)/.exec(part);
            return name ? name[1] : '';
        }).filter(Boolean);
        return { name: match[1], params, line: lineNo };
    }
    return null;
}

/** 从函数上方的 `--- @param <name> EventInfo.<Class>.<Event>` 注解反查事件键 */
export function findAnnotatedEventKeysForParam(
    lines: readonly string[],
    functionLine: number,
    paramName: string,
): string[] {
    const escaped = paramName.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const re = new RegExp(`^\\s*---\\s*@param\\s+${escaped}\\s+EventInfo\\.(\\w+)\\.(\\w+)\\b`);

    for (let i = functionLine - 1; i >= 0 && i >= functionLine - 30; i--) {
        if (!/^\s*---/.test(lines[i])) {
            break;
        }
        const match = re.exec(lines[i]);
        if (match) {
            return [`${match[1]}.${match[2]}`];
        }
    }
    return [];
}

/** 构建事件的 Markdown 文档（描述 + 参数表） */
function buildEventDocumentation(definition: EventDefinition): vscode.MarkdownString {
    const sections: string[] = [];

    if (definition.desc) {
        sections.push(`**${definition.desc}**`);
    }
    if (definition.event_info) {
        const lines = Object.entries(definition.event_info).map(([key, value]) => `- ${key}: ${value}`);
        if (lines.length > 0) {
            sections.push(`参数:\n${lines.join('\n')}`);
        }
    }

    const md = new vscode.MarkdownString(sections.join('\n\n'));
    md.isTrusted = true;
    return md;
}

/** 构建命名回调里的事件字段补全项（按字段名去重） */
function buildEventFieldItems(eventKeys: string[]): vscode.CompletionItem[] {
    const items: vscode.CompletionItem[] = [];
    const seen = new Set<string>();

    for (const eventKey of eventKeys) {
        const definition = state.definitions.get(eventKey);
        if (!definition?.event_info) {
            continue;
        }
        for (const [name, desc] of Object.entries(definition.event_info)) {
            if (seen.has(name)) {
                continue;
            }
            seen.add(name);
            const item = new vscode.CompletionItem(name, vscode.CompletionItemKind.Field);
            item.detail = `any · ${desc || definition.desc || `EventInfo.${eventKey}`}`;
            item.documentation = buildEventDocumentation(definition);
            items.push(item);
        }
    }

    const labelOf = (item: vscode.CompletionItem): string =>
        typeof item.label === 'string' ? item.label : item.label.label;
    return items.sort((a, b) => labelOf(a).localeCompare(labelOf(b)));
}

/** 构建 2.0 模式的补全项（键为完整事件名，补全后自动包裹长括号） */
export function buildEventCompletionItems(definitions: Map<string, EventDefinition>): vscode.CompletionItem[] {
    const items: vscode.CompletionItem[] = [];

    for (const [eventName, definition] of definitions) {
        const item = new vscode.CompletionItem(eventName, vscode.CompletionItemKind.Event);
        item.detail = definition.desc ?? 'MiniWorld 事件';
        item.filterText = eventName;
        item.insertText = eventName;
        item.command = {
            command: 'complete.wrapEventBrackets',
            title: '补全事件长括号',
            arguments: [eventName],
        };
        item.documentation = buildEventDocumentation(definition);
        items.push(item);
    }

    return items;
}

/** 构建 3.0 模式指定事件类的补全项（按类名前缀筛选，直接插入字段名） */
export function buildClassCompletionItems(
    definitions: Map<string, EventDefinition>,
    className: EventClass30,
): vscode.CompletionItem[] {
    const prefix = `${className}.`;
    const items: vscode.CompletionItem[] = [];

    for (const [key, definition] of definitions) {
        if (!key.startsWith(prefix)) {
            continue;
        }
        const fieldName = key.substring(prefix.length);
        const item = new vscode.CompletionItem(fieldName, vscode.CompletionItemKind.Event);
        item.detail = definition.desc ?? `MiniWorld ${className} 事件`;
        item.filterText = fieldName;
        item.insertText = fieldName;
        item.documentation = buildEventDocumentation(definition);
        items.push(item);
    }

    return items;
}

/** 取得 3.0 模式下某事件类的补全项，必要时构建并缓存 */
function getClassItems(className: EventClass30): vscode.CompletionItem[] {
    let items = state.classItems.get(className);
    if (!items) {
        items = buildClassCompletionItems(state.definitions, className);
        state.classItems.set(className, items);
    }
    return items;
}

type CompletionContext =
    | { kind: '2.0' }
    | { kind: '3.0'; className: EventClass30 }
    | { kind: 'event-field'; eventKeys: string[] };

/**
 * 判断光标前的补全上下文。
 * - 2.0：`[=[` 与 `]=]` 之间的长括号字符串内
 * - 3.0：`TriggerEvent.` / `ObjectEvent.` 之后
 */
function getCompletionContext(
    document: vscode.TextDocument,
    position: vscode.Position,
    mode: '2.0' | '3.0',
): CompletionContext | null {
    const lineText = document.lineAt(position.line).text;
    const textBefore = lineText.substring(0, position.character);

    if (mode === '3.0') {
        // 前面须为非标识符或行首，避免误匹配 AddTriggerEvent
        const match = /(?:^|[^\w])(TriggerEvent|ObjectEvent)\.[\w.]*$/.exec(textBefore);
        return match ? { kind: '3.0', className: match[1] as EventClass30 } : null;
    }

    const openIdx = textBefore.lastIndexOf('[=[');
    if (openIdx === -1) {
        return null;
    }

    // `[=[` 与光标之间若已出现 `]=]`，说明光标在字符串之外
    if (textBefore.substring(openIdx + 3).includes(']=]')) {
        return null;
    }
    // 光标之后若已有 `]=]`，说明光标在字符串之外
    if (lineText.substring(position.character).includes(']=]')) {
        return null;
    }

    return { kind: '2.0' };
}

/** 汇总某个函数参数可能对应的 3.0 事件键（注册语句 + LuaDoc 注解） */
function resolveEventKeysForParam(
    document: vscode.TextDocument,
    fn: { name: string; line: number },
    paramName: string,
): string[] {
    const source = document.getText();
    const keys = new Set([
        ...findEventKeysForFunction(source, fn.name),
        ...findAnnotatedEventKeysForParam(source.split(/\r?\n/), fn.line, paramName),
    ]);
    return Array.from(keys);
}

/**
 * 识别命名回调里的 `event.` / `e.` 补全上下文。
 * 通过光标所在函数的参数名和该函数被注册到的事件反查字段列表。
 */
function getEventFieldContext(
    document: vscode.TextDocument,
    position: vscode.Position,
    mode: '2.0' | '3.0',
): CompletionContext | null {
    if (mode !== '3.0') {
        return null;
    }

    const textBefore = document.lineAt(position.line).text.substring(0, position.character);
    const memberMatch = /(?:^|[^\w])([A-Za-z_]\w*)\.$/.exec(textBefore);
    if (!memberMatch) {
        return null;
    }

    const fn = findEnclosingFunction(document, position);
    if (!fn || !fn.params.includes(memberMatch[1])) {
        return null;
    }

    const eventKeys = resolveEventKeysForParam(document, fn, memberMatch[1]);
    return eventKeys.length > 0 ? { kind: 'event-field', eventKeys } : null;
}

/**
 * 注册事件补全提供者和括号包裹命令。
 * 补全模式由设置项 `miniworld.completion` 控制，设置变化时自动重载对应版本定义。
 */
export function registerEventCompletion(context: vscode.ExtensionContext): vscode.Disposable[] {
    const disposables: vscode.Disposable[] = [];

    async function loadEventDefinitions(): Promise<void> {
        const targetMode = getCompletionMode();
        const seq = ++loadSeq;

        state.mode = targetMode;
        state.ready = false;
        state.definitions = new Map();
        state.flatItems = null;
        state.classItems.clear();

        if (targetMode === 'off') {
            return;
        }

        const filePath = getEventDefinitionsFile(context, targetMode);
        const parser = targetMode === '3.0' ? parseLuaEventDefinitions : parseEventDefinitions;

        try {
            const defs = await parser(filePath);
            if (seq !== loadSeq) {
                return;
            }

            state.definitions = defs;
            // 2.0 一次性构建完整缓存；3.0 按需懒构建，避免为未使用的类付出代价
            if (targetMode === '2.0') {
                state.flatItems = buildEventCompletionItems(defs);
            }
            state.ready = true;
        } catch (error) {
            console.warn('加载事件补全定义失败', error);
        }
    }

    void loadEventDefinitions();

    disposables.push(
        vscode.workspace.onDidChangeConfiguration(e => {
            if (e.affectsConfiguration(COMPLETION_MODE_SETTING)) {
                void loadEventDefinitions();
            }
        }),
    );

    disposables.push(
        vscode.languages.registerCompletionItemProvider(
            { language: 'lua' },
            {
                provideCompletionItems(document, position) {
                    if (state.mode === 'off' || !state.ready) {
                        return undefined;
                    }

                    const ctx = getCompletionContext(document, position, state.mode)
                        ?? getEventFieldContext(document, position, state.mode);
                    if (ctx === null) {
                        return undefined;
                    }

                    // 返回缓存项，由 VS Code 基于 filterText 原生过滤；
                    // CompletionList(isIncomplete:false) 让结果被缓存，避免重复触发。
                    if (ctx.kind === '2.0') {
                        return new vscode.CompletionList(state.flatItems ?? [], false);
                    }
                    if (ctx.kind === 'event-field') {
                        return new vscode.CompletionList(buildEventFieldItems(ctx.eventKeys), false);
                    }
                    return new vscode.CompletionList(getClassItems(ctx.className), false);
                },
            },
            '.',
        ),
    );

    disposables.push(
        vscode.languages.registerHoverProvider(
            { language: 'lua' },
            {
                provideHover(document, position) {
                    if (state.mode !== '3.0' || !state.ready) {
                        return undefined;
                    }

                    const wordRange = document.getWordRangeAtPosition(position, /[A-Za-z_]\w*/);
                    if (!wordRange) {
                        return undefined;
                    }
                    const fieldName = document.getText(wordRange);
                    const beforeWord = document.lineAt(wordRange.start.line).text.substring(
                        0,
                        wordRange.start.character,
                    );
                    const memberMatch = /([A-Za-z_]\w*)\.$/.exec(beforeWord);
                    if (!memberMatch) {
                        return undefined;
                    }

                    const fn = findEnclosingFunction(document, wordRange.start);
                    if (!fn || !fn.params.includes(memberMatch[1])) {
                        return undefined;
                    }

                    const details = new Set<string>();
                    for (const eventKey of resolveEventKeysForParam(document, fn, memberMatch[1])) {
                        const definition = state.definitions.get(eventKey);
                        const desc = definition?.event_info?.[fieldName];
                        if (desc) {
                            details.add(desc);
                        }
                    }
                    if (details.size === 0) {
                        return undefined;
                    }

                    const md = new vscode.MarkdownString(
                        `**${fieldName}** · \`any\`\n\n${Array.from(details).join('\n')}`,
                    );
                    md.isTrusted = true;
                    return new vscode.Hover(md, wordRange);
                },
            },
        ),
    );

    disposables.push(
        vscode.commands.registerCommand('complete.wrapEventBrackets', (eventName: unknown) => {
            if (typeof eventName !== 'string' || !eventName) {
                return;
            }

            const editor = vscode.window.activeTextEditor;
            if (!editor) {
                return;
            }

            const document = editor.document;
            const cursor = editor.selection.active;
            const startChar = cursor.character - eventName.length;
            if (startChar < 0) {
                return;
            }

            const lineText = document.lineAt(cursor.line).text;
            const before = lineText.substring(0, startChar);
            const after = lineText.substring(cursor.character);

            const edits = new vscode.WorkspaceEdit();
            const startPos = new vscode.Position(cursor.line, startChar);

            if (!before.endsWith('[=[')) {
                edits.insert(document.uri, startPos, '[=[');
            }
            if (!after.startsWith(']=]')) {
                edits.insert(document.uri, cursor, ']=]');
            }

            if (edits.size > 0) {
                void vscode.workspace.applyEdit(edits);
            }
        }),
    );

    return disposables;
}
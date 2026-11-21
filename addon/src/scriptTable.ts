import * as fs from 'fs';
import * as path from 'path';
import * as vscode from 'vscode';

import { COMPLETION_MODE_SETTING, getCompletionMode } from './completionMode';
import { cached, sourceOf } from './documentCache';

/** 3.0 组件方法声明文件（2.0 无独立 Component 声明，故仅 3.0 支持） */
const COMPONENT_FILE_30 = path.join('declarations', '3.0', 'MNComponent.d.lua');

/** 一个组件方法的声明信息 */
export interface ComponentMethod {
    name: string;
    /** 调用签名，如 AddEvent(eventType, callback, priority, filtern1, filtern2) */
    signature: string;
    description: string;
    /** 逐行说明（描述 + @param + @return） */
    detailLines: string[];
}

/** 当前已加载的组件方法表（方法名 -> 声明） */
const methods = new Map<string, ComponentMethod>();

/**
 * 从 MNComponent.d.lua 原文中解析 Component 的方法声明。
 * 直接解析原文可完整保留 `...`、`param?` 等参数写法（apiSearch 的参数名正则只认 \w+，会截断）。
 */
export function parseComponentMethods(raw: string): Map<string, ComponentMethod> {
    const result = new Map<string, ComponentMethod>();
    const lines = raw.split(/\r?\n/);
    const funcRe = /^\s*function\s+Component[.:](\w+)\s*\(([^)]*)\)/;

    for (let i = 0; i < lines.length; i++) {
        const match = funcRe.exec(lines[i]);
        if (!match) {
            continue;
        }
        const name = match[1];
        const args = match[2].trim();
        const signature = `${name}(${args})`;

        const detailLines: string[] = [];
        let description = '';
        // 向上收集紧邻的 --- 注释（描述 + @param + @return）
        for (let j = i - 1; j >= 0 && lines[j].trim().startsWith('---'); j--) {
            const comment = lines[j].trim().replace(/^---\s?/, '');
            if (/^@/.test(comment)) {
                detailLines.unshift(comment);
            } else if (comment && !/^```/.test(comment)) {
                // 跳过 @ 注解与 markdown 代码块围栏，仅保留纯描述
                description = comment + (description ? '\n' + description : '');
            }
        }
        if (description) {
            detailLines.unshift(description);
        }
        result.set(name, { name, signature, description, detailLines });
    }
    return result;
}

/**
 * 找出文档中的「脚本返回表」变量：既以 `local <name> = {}` 定义、又在文件末尾被 `return <name>` 返回的变量。
 * MiniWorld 脚本（local s = {} ... return s）中的 s 本质是组件对象，
 * 但 LuaLS 只把它当成空表，因此需要扩展识别并补上组件方法。
 */
export function findScriptTableVariables(source: string): Set<string> {
    const declared = new Set<string>();
    const returned = new Set<string>();
    for (const line of source.split(/\r?\n/)) {
        const decl = /^\s*local\s+([A-Za-z_]\w*)\s*=\s*\{/.exec(line);
        if (decl) {
            declared.add(decl[1]);
        }
        const ret = /^\s*return\s+([A-Za-z_]\w*)\s*$/.exec(line);
        if (ret) {
            returned.add(ret[1]);
        }
    }
    const result = new Set<string>();
    for (const name of declared) {
        if (returned.has(name)) {
            result.add(name);
        }
    }
    return result;
}

/** 构建组件方法的 Markdown 说明 */
function buildMethodDocumentation(method: ComponentMethod): vscode.MarkdownString {
    const md = new vscode.MarkdownString();
    md.appendCodeblock(`Component:${method.name}(${method.signature.substring(method.name.length + 1)})`, 'lua');
    if (method.description) {
        md.appendMarkdown(`**${method.description}**\n\n`);
    }
    const detail = method.detailLines
        .filter(line => line !== method.description)
        .map(line => `- \`${line}\``)
        .join('\n');
    if (detail) {
        md.appendMarkdown(detail);
    }
    md.isTrusted = true;
    return md;
}

function getComponentFile(context: vscode.ExtensionContext): string {
    const bundled = path.resolve(context.extensionPath, COMPONENT_FILE_30);
    return fs.existsSync(bundled) ? bundled : path.resolve(context.extensionPath, '..', COMPONENT_FILE_30);
}

/** 当前文档的脚本表变量集合（按文档版本缓存） */
function scriptTablesOf(document: vscode.TextDocument): Set<string> {
    return cached(document, 'scriptTables', snapshot => findScriptTableVariables(snapshot.source));
}

/** 识别光标前 `<脚本表>[.:]` 的接收者，返回脚本表名 */
function scriptTableReceiverBefore(document: vscode.TextDocument, offset: number): string | null {
    const before = sourceOf(document).substring(0, offset);
    const match = /([A-Za-z_]\w*)\s*[.:]$/.exec(before);
    if (!match) {
        return null;
    }
    return scriptTablesOf(document).has(match[1]) ? match[1] : null;
}

/** 取得光标所在组件方法调用的方法名（形如 s:AddEvent / s.AddEvent） */
function componentMethodAt(document: vscode.TextDocument, position: vscode.Position): { receiver: string; method: string; range: vscode.Range } | null {
    const wordRange = document.getWordRangeAtPosition(position, /[A-Za-z_]\w*/);
    if (!wordRange) {
        return null;
    }
    const method = document.getText(wordRange);
    if (!methods.has(method)) {
        return null;
    }
    const before = sourceOf(document).substring(0, document.offsetAt(wordRange.start));
    const match = /([A-Za-z_]\w*)\s*[.:]$/.exec(before);
    if (!match || !scriptTablesOf(document).has(match[1])) {
        return null;
    }
    return { receiver: match[1], method, range: wordRange };
}

/**
 * 注册「脚本返回表组件方法」的补全与悬浮。
 * 不改用户源码：通过识别 local s = {} ... return s，把 Component 的方法补全和说明挂到 s 上。
 */
export function registerScriptTable(context: vscode.ExtensionContext): vscode.Disposable[] {
    const disposables: vscode.Disposable[] = [];

    let loadSeq = 0;
    const load = async (): Promise<void> => {
        const seq = ++loadSeq;
        // 仅 3.0 需要组件方法，避免切到 2.0/off 时无谓读盘
        if (getCompletionMode() !== '3.0') {
            methods.clear();
            return;
        }
        try {
            const raw = await fs.promises.readFile(getComponentFile(context), 'utf8');
            if (seq !== loadSeq) {
                return;
            }
            const parsed = parseComponentMethods(raw);
            methods.clear();
            for (const [name, method] of parsed) {
                methods.set(name, method);
            }
        } catch (error) {
            console.warn('加载组件方法声明失败', error);
        }
    };
    void load();

    disposables.push(
        vscode.workspace.onDidChangeConfiguration(e => {
            if (e.affectsConfiguration(COMPLETION_MODE_SETTING)) {
                void load();
            }
        }),
    );

    const isActive = (): boolean => getCompletionMode() === '3.0' && methods.size > 0;

    disposables.push(
        vscode.languages.registerCompletionItemProvider(
            { language: 'lua' },
            {
                provideCompletionItems(document, position) {
                    if (!isActive()) {
                        return undefined;
                    }
                    const offset = document.offsetAt(position);
                    if (!scriptTableReceiverBefore(document, offset)) {
                        return undefined;
                    }
                    const items: vscode.CompletionItem[] = [];
                    for (const method of methods.values()) {
                        const item = new vscode.CompletionItem(method.name, vscode.CompletionItemKind.Method);
                        item.detail = `Component:${method.signature}`;
                        item.documentation = buildMethodDocumentation(method);
                        items.push(item);
                    }
                    return new vscode.CompletionList(items, false);
                },
            },
            '.',
            ':',
        ),
    );

    disposables.push(
        vscode.languages.registerHoverProvider(
            { language: 'lua' },
            {
                provideHover(document, position) {
                    if (!isActive()) {
                        return undefined;
                    }
                    const found = componentMethodAt(document, position);
                    if (!found) {
                        return undefined;
                    }
                    return new vscode.Hover(buildMethodDocumentation(methods.get(found.method)!), found.range);
                },
            },
        ),
    );

    return disposables;
}

import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';
import Fuse from 'fuse.js';

// 类型定义 

/** API 参数 */
export interface ApiParam {
    name: string;
    type: string;
    desc: string;
}

/** API 返回值 */
export interface ApiReturn {
    type: string;
    desc: string;
}

/** 枚举/事件字段 */
export interface ApiField {
    name: string;
    type: string;
    desc: string;
}

/** 搜索条目 */
export interface ApiItem {
    name: string;
    kind: 'function' | 'enum' | 'event';
    module: string;
    version: '2.0' | '3.0';
    description: string;
    parameters: ApiParam[];
    returns: ApiReturn[];
    fields: ApiField[];
    /** 原始文件路径，用于点击跳转 */
    sourceFile: string;
    /** 函数所在行号 */
    sourceLine: number;
    /** 声明时的类名前缀（如 Player:getPos 的 "Player"），undefined 表示非类方法 */
    className?: string;
}

// 解析器

/**
 * 解析事件字段描述中的参数信息
 * 格式：描述文本 {param1:说明, param2:说明, ...}
 * 返回清洗后的描述和参数字典
 */
function parseEventFieldDesc(raw: string): { cleanDesc: string; eventInfo: Record<string, string> | null } {
    const braceStart = raw.lastIndexOf('{');
    const braceEnd = raw.lastIndexOf('}');
    if (braceStart === -1 || braceEnd <= braceStart) {
        return { cleanDesc: raw, eventInfo: null };
    }

    const cleanDesc = raw.substring(0, braceStart).trim();
    const paramsStr = raw.substring(braceStart + 1, braceEnd);
    const eventInfo: Record<string, string> = {};

    // 解析 key:value 对，支持 key:value 和 key:描述文本（含逗号、冒号）
    // 思路：按逗号分割，但值中也可能含逗号，故用正则逐个提取
    const paramRegex = /(\w[\w.]*)\s*:\s*([^,]+?)(?=\s*,\s*\w[\w.]*\s*:|$)/g;
    let m: RegExpExecArray | null;
    while ((m = paramRegex.exec(paramsStr)) !== null) {
        eventInfo[m[1].trim()] = m[2].trim();
    }

    return { cleanDesc: cleanDesc || raw, eventInfo: Object.keys(eventInfo).length > 0 ? eventInfo : null };
}

/**
 * 从 `.d.lua` 文件中解析出所有 API 条目
 */
function parseLuaDeclarations(filePath: string, version: '2.0' | '3.0'): ApiItem[] {
    const items: ApiItem[] = [];
    const content = fs.readFileSync(filePath, 'utf-8');
    const lines = content.split(/\r?\n/);
    const baseName = path.basename(filePath);
    // 去掉前缀 "MN" 和后缀，作为模块名
    const moduleName = baseName.replace(/\.d\.lua$/, '').replace(/^MN/, '');

    // 解析枚举 / 事件（@field 模式）
    // 这类文件的特征：有 `--- @class Xxx` + 若干 `--- @field`
    // 需要找到所有 @class 块，每个块是一个枚举
    const isEventFile = baseName === 'MNEvent.d.lua';
    let i = 0;
    while (i < lines.length) {
        const classMatch = lines[i].match(/^---\s*@class (\w+)\s*@?(.*)$/);
        if (classMatch) {
            const enumName = classMatch[1];
            const classDesc = classMatch[2].trim();
            const fields: ApiField[] = [];
            // 收集 @class 下方的 @field 行
            let j = i + 1;
            while (j < lines.length) {
                const fieldMatch = lines[j].match(/^---\s*@field (\w+)\s+(\w+)\s*@(.+)$/);
                if (fieldMatch) {
                    const rawDesc = fieldMatch[3].trim();
                    if (isEventFile) {
                        // 解析 3.0 事件参数：描述 {param1:说明, param2:说明, ...}
                        const parsed = parseEventFieldDesc(rawDesc);
                        fields.push({
                            name: fieldMatch[1],
                            type: parsed.eventInfo ? 'event|' + JSON.stringify(parsed.eventInfo) : fieldMatch[2],
                            desc: parsed.cleanDesc,
                        });
                    } else {
                        fields.push({
                            name: fieldMatch[1],
                            type: fieldMatch[2],
                            desc: rawDesc,
                        });
                    }
                    j++;
                } else if (/^---\s*@/.test(lines[j].trim())) {
                    // 其他注解，跳过
                    j++;
                } else {
                    break;
                }
            }

            if (fields.length > 0) {
                const kind = baseName === 'MNEvent.d.lua' ? 'event' : 'enum';
                items.push({
                    name: enumName,
                    kind,
                    module: moduleName,
                    version,
                    description: classDesc || `${enumName} 枚举`,
                    parameters: [],
                    returns: [],
                    fields,
                    sourceFile: filePath,
                    sourceLine: i + 1,
                });
            }
            i = j;
            continue;
        }
        i++;
    }

    // 解析函数 / 方法
    // 支持三种模式：
    //   1. function ClassName:methodName(params) return ... end
    //   2. local funcName = function(params) return ... end
    //   3. function funcName(params) return ... end
    const funcRegex = /(?:function\s+(?:(\w+):)?(\w+)\s*\(|(\w+)\s*=\s*function\s*\()/;
    i = 0;
    while (i < lines.length) {
        const line = lines[i];
        const funcMatch = line.match(funcRegex);
        if (funcMatch) {
            const className = funcMatch[1]; // 类名（如 Player: 中的 Player），可能为 undefined
            const funcName = funcMatch[2] || funcMatch[3];
            if (!funcName || funcName === 'function') {continue;}

            let description = '';
            const params: ApiParam[] = [];
            const returns: ApiReturn[] = [];

            // 向上收集注释
            let j = i - 1;
            while (j >= 0 && lines[j].trim().startsWith('---')) {
                const commentLine = lines[j].trim();

                // @param name type @desc
                const paramMatch = commentLine.match(/^---\s*@param (\w+)\s+(\w+(?:\s*\|\s*\w+)*)\s*@(.+)$/);
                if (paramMatch) {
                    params.unshift({
                        name: paramMatch[1],
                        type: paramMatch[2],
                        desc: paramMatch[3].trim(),
                    });
                    j--;
                    continue;
                }

                // @return type @desc
                const returnMatch = commentLine.match(/^---\s*@return (\w+(?:\s*,\s*\w+)*)\s*@(.+)$/);
                if (returnMatch) {
                    returns.unshift({
                        type: returnMatch[1],
                        desc: returnMatch[2].trim(),
                    });
                    j--;
                    continue;
                }

                // @return type  (无描述)
                const returnSimple = commentLine.match(/^---\s*@return (\w+(?:\s*,\s*\w+)*)$/);
                if (returnSimple) {
                    returns.unshift({ type: returnSimple[1], desc: '' });
                    j--;
                    continue;
                }

                // 纯描述行（累积为完整 Markdown，从下往上遍历故向前插入）
                const descMatch = commentLine.match(/^--- (.+)$/);
                if (descMatch && !descMatch[1].startsWith('@') && !descMatch[1].startsWith('class ')) {
                    const line = descMatch[1].trim();
                    description = line + (description ? '\n' + description : '');
                }
                j--;
            }

            items.push({
                name: funcName,
                kind: 'function',
                module: moduleName,
                className: className || undefined,
                version,
                description,
                parameters: params,
                returns,
                fields: [],
                sourceFile: filePath,
                sourceLine: i + 1,
            });
        }
        i++;
    }

    return items;
}

/**
 * 扫描整个目录，解析所有 API
 */
function scanAllApis(multipleDir: string): ApiItem[] {
    const all: ApiItem[] = [];

    for (const version of ['2.0', '3.0'] as const) {
        const dir = path.join(multipleDir, version);
        if (!fs.existsSync(dir)) {continue;}
        const files = fs.readdirSync(dir).filter(f => f.endsWith('.d.lua') || f.endsWith('.lua'));
        for (const file of files) {
            const filePath = path.join(dir, file);
            try {
                const items = parseLuaDeclarations(filePath, version);
                all.push(...items);
            } catch (err) {
                console.warn(`解析失败: ${filePath}`, err);
            }
        }

        // 额外解析 2.0 的 MNEvent.d.json
        const jsonEventPath = path.join(dir, 'MNEvent.d.json');
        if (fs.existsSync(jsonEventPath)) {
            try {
                const items = parseJsonEvents(jsonEventPath, version);
                all.push(...items);
            } catch (err) {
                console.warn(`解析失败: ${jsonEventPath}`, err);
            }
        }
    }

    return all;
}

/**
 * 解析事件 JSON 文件（如 2.0 的 MNEvent.d.json）
 * 按第二个点号前的部分分组，如 "Game.AnyPlayer.EnterGame" → 组名 "Game.AnyPlayer"
 */
function parseJsonEvents(filePath: string, version: '2.0' | '3.0'): ApiItem[] {
    const items: ApiItem[] = [];
    const raw = fs.readFileSync(filePath, 'utf-8');
    const parsed = JSON.parse(raw) as Record<string, { desc?: string; event_info?: Record<string, string> }>;

    // 按第二个点号前的部分分组
    const groups = new Map<string, {
        subEvents: Array<{ name: string; desc: string; event_info: Record<string, string> }>;
    }>();

    for (const [eventName, def] of Object.entries(parsed)) {
        // 提取组名：取到第二个点号前，如 "Game.AnyPlayer.EnterGame" → "Game.AnyPlayer"
        const firstDot = eventName.indexOf('.');
        const secondDot = firstDot > 0 ? eventName.indexOf('.', firstDot + 1) : -1;

        // 只有大于等于2个点号才分组，否则保持扁平
        if (secondDot > 0) {
            const groupName = eventName.substring(0, secondDot);
            const subName = eventName.substring(secondDot + 1);
            if (!groups.has(groupName)) {
                groups.set(groupName, { subEvents: [] });
            }
            groups.get(groupName)!.subEvents.push({
                name: subName,
                desc: def.desc ?? '',
                event_info: def.event_info ?? {},
            });
        } else {
            // 0 或 1 个点号 → 独立条目
            const module = firstDot > 0 ? eventName.substring(0, firstDot) : 'Event';
            const fields: ApiField[] = [];
            if (def.event_info) {
                for (const [pn, pd] of Object.entries(def.event_info)) {
                    fields.push({ name: pn, type: 'any', desc: pd });
                }
            }
            items.push({
                name: eventName,
                kind: 'event',
                module,
                version,
                description: def.desc ?? '',
                parameters: [],
                returns: [],
                fields,
                sourceFile: filePath,
                sourceLine: -1,
            });
        }
    }

    for (const [groupName, group] of groups.entries()) {
        // 模块名取第一个点号前的部分
        const dotIdx = groupName.indexOf('.');
        const module = dotIdx > 0 ? groupName.substring(0, dotIdx) : 'Event';

        const fields: ApiField[] = group.subEvents.map(se => ({
            name: se.name,
            type: 'event',
            desc: se.desc,
        }));

        // 将完整子事件数据序列化存储到每个 field 中（detail 页用）
        // 用分隔符编码 event_info，避免修改 ApiField 接口
        const fieldsWithData: ApiField[] = group.subEvents.map(se => ({
            name: se.name,
            type: se.event_info && Object.keys(se.event_info).length > 0
                ? 'event|' + JSON.stringify(se.event_info)
                : 'event',
            desc: se.desc,
        }));

        const groupDesc = group.subEvents.map(se => se.desc).filter(Boolean).join('；') || `${groupName} 事件组`;

        items.push({
            name: groupName,
            kind: 'event',
            module,
            version,
            description: groupDesc,
            parameters: [],
            returns: [],
            fields: fieldsWithData,
            sourceFile: filePath,
            sourceLine: -1,
        });
    }

    return items;
}

/**
 * 构建事件详情字段列表，将 event| 编码的子事件参数展开为缩进条目
 */
function buildEventDetailFields(fields: ApiField[]): ApiField[] {
    const result: ApiField[] = [];

    for (const f of fields) {
        let eventInfo: Record<string, string> | undefined;
        let cleanType = f.type;
        if (f.type.startsWith('event|')) {
            try {
                eventInfo = JSON.parse(f.type.substring(6));
                cleanType = 'event';
            } catch { /* ignore */ }
        }

        result.push({ name: f.name, type: cleanType, desc: f.desc });

        if (eventInfo) {
            for (const [paramName, paramDesc] of Object.entries(eventInfo)) {
                result.push({
                    name: `  ${paramName}`,
                    type: 'any',
                    desc: paramDesc,
                });
            }
        }
    }

    return result;
}

// 模糊搜索（基于 fuse.js）

/**
 * 使用 fuse.js 进行模糊搜索，支持多字段加权匹配
 */
function searchItems(
    items: ApiItem[],
    query: string,
    versionFilter: string,
    moduleFilter: string,
    kindFilter: string,
): { results: ApiItem[]; totalCount: number } {
    let filtered = items;

    // 版本/模块/类型筛选
    if (versionFilter !== 'all') {
        filtered = filtered.filter(item => item.version === versionFilter);
    }
    if (moduleFilter !== 'all') {
        filtered = filtered.filter(item => item.module === moduleFilter);
    }
    if (kindFilter !== 'all') {
        filtered = filtered.filter(item => item.kind === kindFilter);
    }

    // 无搜索词时按版本→模块→名称排序
    if (!query.trim()) {
        filtered.sort((a, b) => {
            const verA = a.version === '3.0' ? 0 : 1;
            const verB = b.version === '3.0' ? 0 : 1;
            if (verA !== verB) {return verA - verB;}
            const modCmp = a.module.localeCompare(b.module);
            if (modCmp !== 0) {return modCmp;}
            return a.name.localeCompare(b.name);
        });
        return { results: filtered, totalCount: filtered.length };
    }

    // 文本搜索：剥离尾部括号 ()（），如 getPos() → getPos
    const q = query.trim().toLowerCase().replace(/[（(]\s*[）)]?\s*$/, '');

    const fuse = new Fuse(filtered, {
        keys: [
            { name: 'name', weight: 5 },
            { name: 'module', weight: 2 },
            { name: 'className', weight: 2 },
            { name: 'description', weight: 1 },
            { name: 'parameters.name', weight: 2 },
            { name: 'parameters.desc', weight: 0.5 },
            { name: 'fields.name', weight: 2 },
            { name: 'fields.desc', weight: 0.5 },
            {
                name: 'qualifiedName',
                weight: 4,
                getFn: (item: ApiItem) => {
                    const names: string[] = [];
                    if (item.module) {
                        names.push(`${item.module}:${item.name}`);
                        names.push(`${item.module}.${item.name}`);
                    }
                    if (item.className) {
                        names.push(`${item.className}:${item.name}`);
                        names.push(`${item.className}.${item.name}`);
                    }
                    return names;
                },
            },
        ],
        threshold: 0.3,
        minMatchCharLength: 1,
        includeScore: true,
        shouldSort: true,
        findAllMatches: true,
    });

    const fuseResults = fuse.search(q);
    const results = fuseResults.map(r => r.item);

    return { results, totalCount: results.length };
}

// Webview View Provider

export class ApiSearchProvider implements vscode.WebviewViewProvider {
    public static readonly viewType = 'miniworld.apiSearchView';
    private _view?: vscode.WebviewView;
    private _allItems: ApiItem[] = [];

    constructor(
        private readonly _extensionUri: vscode.Uri,
        context: vscode.ExtensionContext,
    ) {
        const multipleDir = context.asAbsolutePath(path.join('multiple'));
        this._allItems = scanAllApis(multipleDir);
    }

    /** 刷新数据（用于重新加载） */
    public refresh(): void {
        const multipleDir = (vscode.extensions.getExtension('LK-cmyk.miniworld-api-desc')
            ?.extensionPath ?? this._extensionUri.fsPath);
        const baseDir = path.join(multipleDir, 'multiple');
        if (fs.existsSync(baseDir)) {
            this._allItems = scanAllApis(baseDir);
        }
        if (this._view) {
            this._sendInitData();
        }
    }

    resolveWebviewView(
        webviewView: vscode.WebviewView,
        _context: vscode.WebviewViewResolveContext,
        _token: vscode.CancellationToken,
    ): void {
        this._view = webviewView;

        webviewView.webview.options = {
            enableScripts: true,
            localResourceRoots: [
                vscode.Uri.joinPath(this._extensionUri, 'node_modules'),
                vscode.Uri.joinPath(this._extensionUri, 'multiple'),
                vscode.Uri.joinPath(this._extensionUri, 'addon', 'webview'),
            ],
        };

        webviewView.webview.html = this._getHtmlContent(webviewView.webview);

        webviewView.webview.onDidReceiveMessage(msg => {
            switch (msg.type) {
                case 'ready':
                    this._sendInitData();
                    break;
                case 'search':
                    this._handleSearch(msg.query, msg.version, msg.module, msg.kind);
                    break;
                case 'showDetail':
                    this._handleShowDetail(msg);
                    break;
                case 'copy':
                    vscode.env.clipboard.writeText(msg.text).then(() => {
                        vscode.window.showInformationMessage(`已复制: ${msg.text}`);
                    });
                    break;
            }
        });
    }

    private _sendInitData(): void {
        const modules20 = new Set<string>();
        const modules30 = new Set<string>();
        const counts = { total: this._allItems.length, func: 0, enum: 0, event: 0 };
        const excluded = new Set(['Event', 'EnumLib']);
        for (const item of this._allItems) {
            if (!excluded.has(item.module)) {
                if (item.version === '2.0') {modules20.add(item.module);}
                else {modules30.add(item.module);}
            }
            if (item.kind === 'function') {counts.func++;}
            else if (item.kind === 'enum') {counts.enum++;}
            else if (item.kind === 'event') {counts.event++;}
        }

        this._view?.webview.postMessage({
            type: 'initData',
            modules20: Array.from(modules20).sort(),
            modules30: Array.from(modules30).sort(),
            counts,
        });
    }

    private _handleSearch(query: string, version: string, module: string, kind: string): void {
        const { results, totalCount } = searchItems(this._allItems, query, version, module, kind);
        const q = query.trim().toLowerCase();

        // 将枚举/事件的字段展开为单独条目
        const expanded: Array<{
            name: string; kind: string; module: string; version: string;
            description: string; paramCount: number; returnCount: number; fieldCount: number;
            sourceFile: string; sourceLine: number;
            parameters: ApiParam[]; returns: ApiReturn[]; fields: ApiField[];
            displayName?: string;
        }> = [];

        // 不显示的事件父类（仅隐藏无点号的类名，子事件如 TriggerEvent.GameStart 仍显示）
        const hiddenEventParents = new Set(['TriggerEvent', 'CurEventParam', 'ObjectEvent']);

        for (const item of results) {
            // JSON 事件已按组名聚合，不展开子事件
            const isJsonEvent = item.sourceFile.endsWith('.json');

            if ((item.kind === 'enum' || item.kind === 'event') && item.fields.length > 0 && !isJsonEvent) {
                // 每个字段展开为独立条目
                let matchedAnyField = false;
                for (const field of item.fields) {
                    // 有搜索词时只包含匹配的字段（简单字符级模糊匹配）
                    const lowerFieldName = field.name.toLowerCase();
                    const lowerFieldDesc = field.desc.toLowerCase();
                    if (q && !lowerFieldName.includes(q) && !lowerFieldDesc.includes(q)) {
                        continue;
                    }
                    matchedAnyField = true;
                    expanded.push({
                        name: `${item.name}.${field.name}`,
                        kind: item.kind,
                        module: item.module,
                        version: item.version,
                        description: field.desc,
                        paramCount: 0,
                        returnCount: 0,
                        fieldCount: 0,
                        sourceFile: item.sourceFile,
                        sourceLine: item.sourceLine,
                        parameters: [],
                        returns: [],
                        fields: [],
                    });
                }
                // 如果字段全部被过滤（搜索词不匹配任何字段），至少保留类本身
                // 但隐藏事件父类（TriggerEvent / CurEventParam / ObjectEvent）
                if (!matchedAnyField && !hiddenEventParents.has(item.name)) {
                    expanded.push({
                        name: item.name,
                        kind: item.kind,
                        module: item.module,
                        version: item.version,
                        description: item.description,
                        paramCount: 0,
                        returnCount: 0,
                        fieldCount: item.fields.length,
                        sourceFile: item.sourceFile,
                        sourceLine: item.sourceLine,
                        parameters: [],
                        returns: [],
                        fields: [],
                    });
                }
            } else if (!hiddenEventParents.has(item.name)) {
                expanded.push({
                    name: item.name,
                    displayName: item.kind === 'function'
                        ? (item.className ? `${item.className}:${item.name}()` : `${item.name}()`)
                        : undefined,
                    kind: item.kind,
                    module: item.module,
                    version: item.version,
                    description: item.description,
                    paramCount: item.parameters.length,
                    returnCount: item.returns.length,
                    fieldCount: 0,
                    sourceFile: item.sourceFile,
                    sourceLine: item.sourceLine,
                    parameters: item.parameters.slice(0, 5),
                    returns: item.returns.slice(0, 3),
                    fields: [],
                });
            }
        }

        // 保留字段展开后的总数
        const expandedTotal = expanded.length;

        // 已实现前端分页（25条/页），不再限制条数
        const limited = expanded;

        this._view?.webview.postMessage({
            type: 'searchResults',
            results: limited,
            totalCount: expandedTotal,
            shownCount: limited.length,
        });
    }

    private _openFile(filePath: string, line: number): void {
        const uri = vscode.Uri.file(filePath);
        vscode.workspace.openTextDocument(uri).then(doc => {
            vscode.window.showTextDocument(doc, {
                selection: new vscode.Range(line - 1, 0, line - 1, 0),
            });
        });
    }

    private _handleShowDetail(msg: { name: string; sourceFile: string; sourceLine: number; kind: string }): void {
        // 辅助：剥离模块前缀和尾部括号，提取裸函数名
        const getBareName = (n: string, k: string): string => {
            let bare = n;
            if (k === 'function') {
                bare = bare.replace(/[（(]\s*[）)]\s*$/, '').trim();
                const sepIdx = bare.search(/[.,:]/);
                if (sepIdx > 0) {
                    bare = bare.substring(sepIdx + 1).trim();
                }
            }
            return bare;
        };

        // 1. 精确匹配（name + sourceFile + sourceLine）
        let item = this._allItems.find(i =>
            i.name === msg.name &&
            i.sourceFile === msg.sourceFile &&
            i.sourceLine === msg.sourceLine
        );

        // 2. 用裸函数名再试（处理带模块前缀的函数名）
        if (!item && msg.kind === 'function') {
            const bareName = getBareName(msg.name, msg.kind);
            item = this._allItems.find(i =>
                i.name === bareName &&
                i.sourceFile === msg.sourceFile &&
                i.sourceLine === msg.sourceLine
            );
        }

        // 3. 精确匹配失败，尝试按 name + sourceFile 再找一次（JSON 事件行号均为 -1）
        if (!item) {
            item = this._allItems.find(i =>
                i.name === msg.name &&
                i.sourceFile === msg.sourceFile
            );
        }

        // 4. 仍失败 → 可能是展开的字段条目 (name 包含 .)，找到父类再取具体字段
        let fieldDetail: { name: string; type: string; desc: string } | undefined;
        if (!item) {
            const dotIdx = msg.name.lastIndexOf('.');
            if (dotIdx > 0) {
                const parentName = msg.name.substring(0, dotIdx);
                const fieldName = msg.name.substring(dotIdx + 1);
                const parent = this._allItems.find(i => i.name === parentName && i.sourceFile === msg.sourceFile);
                if (parent) {
                    item = parent;
                    fieldDetail = parent.fields.find(f => f.name === fieldName);
                }
            }
        }

        if (!item) {
            this._view?.webview.postMessage({ type: 'detailResult', error: '未找到条目' });
            return;
        }

        // 构建详情数据
        let parameters = item.parameters;
        let returns = item.returns;
        let fields = item.fields;
        let description = fieldDetail ? fieldDetail.desc : item.description;

        // 解码事件参数：JSON 分组事件或 3.0 事件都可能有 event| 编码的子事件数据
        const isEventSource = item.sourceFile.endsWith('.json') || item.sourceFile.endsWith('MNEvent.d.lua');
        let detailFields = item.fields;

        if (isEventSource && !fieldDetail) {
            // 对整个条目（分组事件 / 事件类）展开子事件列表及参数
            detailFields = buildEventDetailFields(item.fields);
        } else if (fieldDetail) {
            // 单个展开的字段条目（如 TriggerEvent.GameStart）
            // 只显示事件参数，不显示事件名本身
            detailFields = [];
            if (fieldDetail.type.startsWith('event|')) {
                try {
                    const eventInfo = JSON.parse(fieldDetail.type.substring(6));
                    for (const [pn, pd] of Object.entries(eventInfo)) {
                        detailFields.push({ name: pn, type: 'any', desc: pd as string });
                    }
                } catch { /* ignore */ }
            }
        }

        this._view?.webview.postMessage({
            type: 'detailResult',
            detail: {
                name: msg.name,
                kind: item.kind,
                module: item.module,
                className: item.className,
                version: item.version,
                description,
                sourceFile: item.sourceFile,
                sourceLine: item.sourceLine,
                parameters,
                returns,
                fields: detailFields,
            },
        });
    }

    private _getNonce(): string {
        let text = '';
        const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        for (let i = 0; i < 64; i++) {
            text += chars.charAt(Math.floor(Math.random() * chars.length));
        }
        return text;
    }

    private _getHtmlContent(webview: vscode.Webview): string {
        const nonce = this._getNonce();

        const webviewDir = vscode.Uri.joinPath(this._extensionUri, 'addon', 'webview');
        const cssUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'style.css'));
        const scriptUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'script.js'));

        // 读取 SVG 图标文件，直接内联为 <svg> 元素（零外部依赖、无 CSP 问题）
        const iconDir = path.join(this._extensionUri.fsPath, 'addon', 'webview', 'assets', 'img');
        const readSvg = (name: string): string => {
            const filePath = path.join(iconDir, name);
            try {
                return fs.readFileSync(filePath, 'utf-8').trim();
            } catch {
                return '';
            }
        };
        const searchSvg = readSvg('search.svg');
        const closeSvg = readSvg('close.svg');
        const copySvg = readSvg('copy.svg');
        const checkSvg = readSvg('check.svg');

        // SVG 的 HTML 转义版本（用于 data-* 属性，避免双引号破坏属性结构）
        const escHtml = (s: string) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        const copySvgAttr = escHtml(copySvg);
        const checkSvgAttr = escHtml(checkSvg);
        const searchSvgAttr = escHtml(searchSvg);

        // 读取 marked 库并内联到 HTML 中
        const markedPath = path.join(this._extensionUri.fsPath, 'node_modules', 'marked', 'lib', 'marked.umd.js');
        let markedScript = '';
        if (fs.existsSync(markedPath)) {
            markedScript = fs.readFileSync(markedPath, 'utf-8');
        } else {
            console.warn('marked 库未找到，将使用降级方案');
            // 降级方案：提供一个空的 marked polyfill
            markedScript = 'window.marked={parse:function(t){return t},parseInline:function(t){return t}};';
        }

        const htmlPath = vscode.Uri.joinPath(webviewDir, 'search.html');
        let html = fs.readFileSync(htmlPath.fsPath, 'utf-8');

        html = html
            .replace(/\{\{nonce\}\}/g, nonce)
            .replace(/\{\{cspUri\}\}/g, webview.cspSource)
            .replace(/\{\{cssUri\}\}/g, cssUri.toString())
            .replace(/\{\{scriptUri\}\}/g, scriptUri.toString())
            // 直接内联 SVG（作为 DOM 元素）
            .replace(/\{\{searchSvg\}\}/g, searchSvg)
            .replace(/\{\{closeSvg\}\}/g, closeSvg)
            .replace(/\{\{copySvg\}\}/g, copySvg)
            .replace(/\{\{checkSvg\}\}/g, checkSvg)
            // HTML 转义版本（用于 data-* 属性，避免双引号破坏结构）
            .replace(/\{\{copySvgAttr\}\}/g, copySvgAttr)
            .replace(/\{\{checkSvgAttr\}\}/g, checkSvgAttr)
            .replace(/\{\{searchSvgAttr\}\}/g, searchSvgAttr)
            .replace('</head>',
                `<script nonce="${nonce}">${markedScript}</script>\n</head>`);

        return html;
    }
}

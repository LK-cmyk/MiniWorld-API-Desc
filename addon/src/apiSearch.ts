import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';

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
    // 支持两种模式：
    //   1. function ClassName:methodName(params) return ... end
    //   2. local funcName = function(params) return ... end
    //   3. function funcName(params) return ... end
    const funcRegex = /(?:function\s+(?:\w+:)?(\w+)\s*\(|(\w+)\s*=\s*function\s*\()/;
    i = 0;
    while (i < lines.length) {
        const line = lines[i];
        const funcMatch = line.match(funcRegex);
        if (funcMatch) {
            const funcName = funcMatch[1] || funcMatch[2];
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

                // 纯描述行
                const descMatch = commentLine.match(/^--- (.+)$/);
                if (descMatch && !descMatch[1].startsWith('@') && !descMatch[1].startsWith('class ')) {
                    description = descMatch[1].trim();
                }
                j--;
            }

            items.push({
                name: funcName,
                kind: 'function',
                module: moduleName,
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

// 模糊搜索

/** 字符级模糊匹配（按顺序匹配字符） */
function fuzzyMatchChar(text: string, query: string): boolean {
    const lower = text.toLowerCase();
    const q = query.toLowerCase();
    let qi = 0;
    for (let i = 0; i < lower.length && qi < q.length; i++) {
        if (lower[i] === q[qi]) {qi++;}
    }
    return qi === q.length;
}

/** 计算搜索相关性分数 */
function scoreItem(item: ApiItem, query: string): number {
    const q = query.toLowerCase();
    const name = item.name.toLowerCase();
    const desc = item.description.toLowerCase();
    let score = 0;

    // 完全匹配
    if (name === q) {score += 200;}
    // 前缀匹配
    if (name.startsWith(q)) {score += 100;}
    // 驼峰分词匹配（如 "GP" 匹配 "GetPosition"）
    const initials = name.replace(/[a-z]/g, '');
    if (initials.includes(q)) {score += 60;}
    // 包含匹配
    if (name.includes(q)) {score += 30;}
    // 模糊字符匹配
    if (fuzzyMatchChar(name, q)) {score += 10;}
    // 参数名匹配
    if (item.parameters.some(p => fuzzyMatchChar(p.name.toLowerCase(), q))) {score += 8;}
    // 描述匹配
    if (fuzzyMatchChar(desc, q)) {score += 5;}
    // 字段名匹配
    if (item.fields.some(f => fuzzyMatchChar(f.name.toLowerCase(), q))) {score += 5;}

    // 点号搜索：类名.字段名 匹配
    const dotIdx = q.indexOf('.');
    if (dotIdx > 0) {
        const className = q.substring(0, dotIdx);
        const fieldName = q.substring(dotIdx + 1);
        if (fieldName) {
            if (fuzzyMatchChar(name, className) && item.fields.some(f => fuzzyMatchChar(f.name.toLowerCase(), fieldName))) {
                score += 150;
            }
        }
    }

    return score;
}

/**
 * 检查点号查询是否匹配（如 "BlockType.Sto" 匹配 BlockType 的 Stone 字段）
 */
function matchDotQuery(item: ApiItem, q: string): boolean {
    const dotIdx = q.indexOf('.');
    if (dotIdx <= 0) {return false;}
    const className = q.substring(0, dotIdx);
    const fieldName = q.substring(dotIdx + 1);
    if (!fieldName) {return false;}
    return fuzzyMatchChar(item.name.toLowerCase(), className) &&
        item.fields.some(f => fuzzyMatchChar(f.name.toLowerCase(), fieldName));
}

/** 过滤并排序搜索结果 */
function searchItems(
    items: ApiItem[],
    query: string,
    versionFilter: string,
    moduleFilter: string,
    kindFilter: string,
): { results: ApiItem[]; totalCount: number } {
    let filtered = items;

    // 版本筛选
    if (versionFilter !== 'all') {
        filtered = filtered.filter(item => item.version === versionFilter);
    }

    // 模块筛选
    if (moduleFilter !== 'all') {
        filtered = filtered.filter(item => item.module === moduleFilter);
    }

    // 类型筛选
    if (kindFilter !== 'all') {
        filtered = filtered.filter(item => item.kind === kindFilter);
    }

    // 文本搜索
    if (query.trim()) {
        const q = query.trim().toLowerCase();
        filtered = filtered.filter(item => {
            // 点号查询：类名.字段名
            if (q.includes('.') && matchDotQuery(item, q)) {return true;}
            // 常规模糊匹配
            if (fuzzyMatchChar(item.name.toLowerCase(), q)) {return true;}
            if (fuzzyMatchChar(item.description.toLowerCase(), q)) {return true;}
            if (item.parameters.some(p =>
                fuzzyMatchChar(p.name.toLowerCase(), q) ||
                fuzzyMatchChar(p.desc.toLowerCase(), q)
            )) {return true;}
            if (item.fields.some(f =>
                fuzzyMatchChar(f.name.toLowerCase(), q) ||
                fuzzyMatchChar(f.desc.toLowerCase(), q)
            )) {return true;}
            return false;
        });

        // 按相关性排序，同分时按自定义顺序排序
        filtered.sort((a, b) => {
            const scoreDiff = scoreItem(b, q) - scoreItem(a, q);
            if (scoreDiff !== 0) {return scoreDiff;}
            return customSortCompare(a, b);
        });
    } else {
        // 无搜索词时按版本 → 模块 → 名称排序（不分种类，避免第1页全是函数）
        filtered.sort((a, b) => {
            const verCmp = versionWeight(a.version) - versionWeight(b.version);
            if (verCmp !== 0) {return verCmp;}
            const modCmp = a.module.localeCompare(b.module);
            if (modCmp !== 0) {return modCmp;}
            return a.name.localeCompare(b.name);
        });
    }

    return { results: filtered, totalCount: filtered.length };
}

/** 种类权重：函数→枚举→事件 */
function kindWeight(kind: string): number {
    switch (kind) {
        case 'function': return 0;
        case 'enum': return 1;
        case 'event': return 2;
        default: return 3;
    }
}

/** 事件类内部顺序：TriggerEvent→ObjectEvent→CurEventParam→其他 */
function eventClassWeight(name: string): number {
    if (name === 'TriggerEvent') {return 0;}
    if (name === 'ObjectEvent') {return 1;}
    if (name === 'CurEventParam') {return 2;}
    return 3;
}

/** 版本权重：3.0→2.0 */
function versionWeight(version: string): number {
    return version === '3.0' ? 0 : 1;
}

/** 自定义排序比较器 */
function customSortCompare(a: ApiItem, b: ApiItem): number {
    // 1. 种类排序：函数→枚举→事件
    const kindCmp = kindWeight(a.kind) - kindWeight(b.kind);
    if (kindCmp !== 0) {return kindCmp;}

    // 2. 事件类内部排序：TriggerEvent→ObjectEvent→CurEventParam
    if (a.kind === 'event') {
        const evtCmp = eventClassWeight(a.name) - eventClassWeight(b.name);
        if (evtCmp !== 0) {return evtCmp;}
    }

    // 3. 版本排序：3.0→2.0
    const verCmp = versionWeight(a.version) - versionWeight(b.version);
    if (verCmp !== 0) {return verCmp;}

    // 4. 模块名排序
    const modCmp = a.module.localeCompare(b.module);
    if (modCmp !== 0) {return modCmp;}

    // 5. 名称排序
    return a.name.localeCompare(b.name);
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
                    // 有搜索词时只包含匹配的字段
                    if (q && !fuzzyMatchChar(field.name.toLowerCase(), q) && !fuzzyMatchChar(field.desc.toLowerCase(), q)) {
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
        // 优先精确匹配（name + sourceFile + sourceLine）
        let item = this._allItems.find(i =>
            i.name === msg.name &&
            i.sourceFile === msg.sourceFile &&
            i.sourceLine === msg.sourceLine
        );

        // 精确匹配失败，尝试按 name + sourceFile 再找一次（JSON 事件行号均为 -1）
        if (!item) {
            item = this._allItems.find(i =>
                i.name === msg.name &&
                i.sourceFile === msg.sourceFile
            );
        }

        // 仍失败 → 可能是展开的字段条目 (name 包含 .)，找到父类再取具体字段
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

    private _getHtmlContent(webview: vscode.Webview): string {
        return /* html */ `<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Security-Policy" content="default-src 'none'; style-src 'unsafe-inline'; script-src 'unsafe-inline';">
    <title>MiniWorld API 搜索</title>
    <style>
        :root {
            --bg: var(--vscode-sideBar-background, #1e1e1e);
            --fg: var(--vscode-sideBar-foreground, #ccc);
            --input-bg: var(--vscode-input-background, #3c3c3c);
            --input-fg: var(--vscode-input-foreground, #ccc);
            --input-border: var(--vscode-input-border, transparent);
            --badge-bg: var(--vscode-badge-background, #4d4d4d);
            --badge-fg: var(--vscode-badge-foreground, #fff);
            --list-hover: var(--vscode-list-hoverBackground, #2a2d2e);
            --list-active: var(--vscode-list-activeSelectionBackground, #094771);
            --border: var(--vscode-panel-border, #333);
            --font: var(--vscode-font-family, -apple-system, sans-serif);
            --font-mono: var(--vscode-editor-font-family, 'Consolas', monospace);
            --font-size: var(--vscode-font-size, 13px);
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: var(--font);
            font-size: var(--font-size);
            color: var(--fg);
            background: var(--bg);
            padding: 8px;
            overflow-x: hidden;
        }

        /* 搜索框 */
        .search-box {
            width: 100%;
            padding: 6px 10px;
            background: var(--input-bg);
            color: var(--input-fg);
            border: 1px solid var(--input-border);
            border-radius: 4px;
            font-size: 14px;
            outline: none;
            margin-bottom: 6px;
        }
        .search-box:focus {
            border-color: var(--vscode-focusBorder, #007fd4);
        }

        /* 筛选栏 */
        .filters {
            display: flex;
            flex-direction: column;
            gap: 4px;
            margin-bottom: 6px;
        }
        .filter-row {
            display: flex;
            flex-wrap: wrap;
            gap: 4px;
            align-items: center;
        }
        .filter-btn {
            padding: 2px 8px;
            border: 1px solid var(--border);
            border-radius: 3px;
            background: transparent;
            color: var(--fg);
            font-size: 11px;
            cursor: pointer;
            white-space: nowrap;
            opacity: 0.7;
            transition: opacity 0.15s;
        }
        .filter-btn:hover { opacity: 1; }
        .filter-btn.active {
            opacity: 1;
            background: var(--list-active);
            border-color: var(--list-active);
        }

        select.filter-select {
            padding: 2px 6px;
            background: var(--input-bg);
            color: var(--input-fg);
            border: 1px solid var(--border);
            border-radius: 3px;
            font-size: 11px;
            cursor: pointer;
            max-width: 120px;
        }
        select.filter-select:disabled {
            opacity: 0.4;
            cursor: not-allowed;
        }

        /* 统计 */
        .stats {
            font-size: 11px;
            opacity: 0.7;
            margin-bottom: 6px;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        /* 结果列表 */
        .results { display: flex; flex-direction: column; gap: 2px; }

        .result-item {
            padding: 6px 8px;
            border-radius: 3px;
            cursor: pointer;
            transition: background 0.1s;
            border-left: 3px solid transparent;
        }
        .result-item:hover { background: var(--list-hover); }
        .result-item.version-2\\.0 { border-left-color: #4ec9b0; }
        .result-item.version-3\\.0 { border-left-color: #569cd6; }

        .result-header {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-wrap: wrap;
        }
        .result-name {
            font-family: var(--font-mono);
            font-weight: 600;
            font-size: 13px;
            color: var(--vscode-textLink-foreground, #3794ff);
        }
        .result-kind {
            font-size: 10px;
            padding: 1px 5px;
            border-radius: 3px;
            font-weight: 500;
        }
        .kind-function { background: #1b6d3b; color: #fff; }
        .kind-enum { background: #6b3b8a; color: #fff; }
        .kind-event { background: #a56a1b; color: #fff; }

        .result-version {
            font-size: 10px;
            padding: 1px 5px;
            border-radius: 3px;
            font-weight: 500;
        }
        .version-2\\.0-tag { background: #0d4a3a; color: #4ec9b0; }
        .version-3\\.0-tag { background: #1a3a5c; color: #569cd6; }

        .result-module {
            font-size: 11px;
            opacity: 0.6;
        }

        .result-tags {
            display: flex;
            align-items: center;
            gap: 6px;
            margin-top: 2px;
            margin-bottom: 0;
        }
        .result-desc {
            font-size: 12px;
            opacity: 0.8;
            margin-top: 1px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .result-meta {
            font-size: 11px;
            opacity: 0.55;
            margin-top: 2px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        /* 空状态 */
        .empty {
            text-align: center;
            padding: 24px 12px;
            opacity: 0.5;
            font-size: 13px;
        }
        .empty .title { font-size: 15px; margin-bottom: 4px; }
        .loading {
            text-align: center;
            padding: 24px;
            opacity: 0.5;
        }

        /* 工具类 */
        .hidden { display: none !important; }

        /* 详情页面 */
        .detail-view {
            padding: 0;
        }
        .detail-back {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 8px;
            border: 1px solid var(--border);
            border-radius: 3px;
            background: transparent;
            color: var(--fg);
            font-size: 12px;
            cursor: pointer;
            margin-bottom: 10px;
            opacity: 0.7;
        }
        .detail-back:hover { opacity: 1; }

        .detail-header {
            display: flex;
            align-items: center;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 8px;
        }
        .detail-name {
            font-family: var(--font-mono);
            font-weight: 700;
            font-size: 16px;
            color: var(--vscode-textLink-foreground, #3794ff);
            word-break: break-all;
        }
        .detail-section {
            margin-bottom: 12px;
        }
        .detail-section-title {
            font-size: 12px;
            font-weight: 600;
            opacity: 0.7;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
            padding-bottom: 3px;
            border-bottom: 1px solid var(--border);
        }
        .detail-desc {
            font-size: 13px;
            opacity: 0.85;
            line-height: 1.5;
            word-break: break-word;
        }
        .detail-grid {
            font-size: 12px;
        }
        .detail-grid .grid-header {
            display: flex;
            gap: 0;
            padding: 4px 6px;
            opacity: 0.6;
            font-weight: 500;
            border-bottom: 1px solid var(--border);
        }
        .detail-grid .grid-header span {
            flex: 1 1 0;
        }
        .detail-grid .grid-header .h-name { flex: 0 0 70px; }
        .detail-grid .grid-header .h-type { flex: 0 0 60px; }
        .detail-grid .grid-header .h-desc { flex: 1 1 0; }

        .detail-grid .grid-row {
            display: flex;
            flex-direction: column;
            gap: 0;
        }
        .detail-grid .grid-row:hover {
            background: var(--list-hover);
        }
        .detail-grid .grid-cell {
            padding: 4px 6px;
            flex: 1 1 0;
        }
        .detail-grid .cell-name {
            font-family: var(--font-mono);
            color: var(--vscode-textLink-foreground, #3794ff);
        }
        .detail-grid .cell-type {
            font-family: var(--font-mono);
            opacity: 0.7;
        }
        .detail-grid .cell-desc {
            opacity: 0.8;
            flex: 2 1 0;
        }
        .detail-source {
            font-size: 11px;
            opacity: 0.4;
            margin-top: 16px;
            word-break: break-all;
        }

        /* 分页 */
        .pagination {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 10px;
            padding: 6px 0;
            flex-wrap: wrap;
        }
        .pagination button {
            padding: 3px 10px;
            border: 1px solid var(--border);
            border-radius: 3px;
            background: transparent;
            color: var(--fg);
            font-size: 12px;
            cursor: pointer;
            opacity: 0.7;
            transition: opacity 0.15s;
        }
        .pagination button:hover { opacity: 1; }
        .pagination button:disabled { opacity: 0.3; cursor: default; }
        .pagination .page-info {
            font-size: 12px;
            opacity: 0.7;
            white-space: nowrap;
        }
        .pagination .page-input {
            width: 40px;
            padding: 2px 4px;
            background: var(--input-bg);
            color: var(--input-fg);
            border: 1px solid var(--input-border);
            border-radius: 3px;
            font-size: 12px;
            text-align: center;
            outline: none;
        }
        .pagination .page-input:focus {
            border-color: var(--vscode-focusBorder, #007fd4);
        }
    </style>
</head>
<body>
    <!-- 搜索视图 -->
    <div id="searchView">
        <input type="text" class="search-box" id="searchInput"
               placeholder="搜索 API 名称、参数、描述… (模糊匹配)" autofocus />

        <div class="filters">
            <div class="filter-row">
                <button class="filter-btn active" data-filter="version" data-value="all">全部版本</button>
                <button class="filter-btn" data-filter="version" data-value="2.0">2.0</button>
                <button class="filter-btn" data-filter="version" data-value="3.0">3.0</button>

                <select class="filter-select" id="moduleFilter">
                    <option value="all">全部模块</option>
                </select>
            </div>

            <div class="filter-row">
                <button class="filter-btn active" data-filter="kind" data-value="all">全部</button>
                <button class="filter-btn" data-filter="kind" data-value="function">函数</button>
                <button class="filter-btn" data-filter="kind" data-value="enum">枚举</button>
                <button class="filter-btn" data-filter="kind" data-value="event">事件</button>
            </div>
        </div>

        <div class="stats" id="stats">
            <span id="resultCount">加载中…</span>
        </div>

        <div class="results" id="results"></div>
        <div class="pagination" id="pagination"></div>
        <div class="loading" id="loading">正在加载 API 数据…</div>
    </div>

    <!-- 详情视图 -->
    <div id="detailView" class="detail-view hidden">
        <button class="detail-back" id="detailBack">← 返回搜索</button>
        <div id="detailContent"></div>
    </div>

    <script>
        (function() {
            const vscode = acquireVsCodeApi();
            const searchView = document.getElementById('searchView');
            const detailView = document.getElementById('detailView');
            const detailContent = document.getElementById('detailContent');
            const detailBack = document.getElementById('detailBack');
            const searchInput = document.getElementById('searchInput');
            const resultsEl = document.getElementById('results');
            const paginationEl = document.getElementById('pagination');
            const statsEl = document.getElementById('resultCount');
            const loadingEl = document.getElementById('loading');
            const moduleSelect = document.getElementById('moduleFilter');

            let state = {
                version: 'all',
                module: 'all',
                kind: 'all',
                query: '',
                modules20: [],
                modules30: [],
                totalCount: 0,
                pageSize: 25,
                currentPage: 1,
                allResults: [],
            };

            // 更新模块下拉选项
            function updateModuleOptions(version) {
                let mods;
                if (version === '2.0') {mods = state.modules20;}
                else if (version === '3.0') {mods = state.modules30;}
                else {mods = [...new Set([...state.modules20, ...state.modules30])].sort();}
                const currentVal = moduleSelect.value;
                moduleSelect.innerHTML = '<option value="all">全部模块</option>';
                for (const mod of mods) {
                    const opt = document.createElement('option');
                    opt.value = mod;
                    opt.textContent = mod;
                    moduleSelect.appendChild(opt);
                }
                const keep = currentVal !== 'all' && mods.includes(currentVal);
                moduleSelect.value = keep ? currentVal : 'all';
                if (!keep) {state.module = 'all';}
                // 事件/枚举模式下禁用模块筛选
                if (state.kind === 'event' || state.kind === 'enum') {
                    moduleSelect.disabled = true;
                } else {
                    moduleSelect.disabled = false;
                }
            }

            // 筛选按钮
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    const filter = btn.dataset.filter;
                    const value = btn.dataset.value;
                    // 同组按钮反选
                    document.querySelectorAll(\`.filter-btn[data-filter="\${filter}"]\`).forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');

                    if (filter === 'version') {
                        state.version = value;
                        // 切换版本时更新模块下拉
                        updateModuleOptions(value);
                    }
                    if (filter === 'kind') {
                        state.kind = value;
                        // 事件/枚举模式下禁用模块筛选
                        if (value === 'event' || value === 'enum') {
                            moduleSelect.disabled = true;
                            moduleSelect.value = 'all';
                            state.module = 'all';
                        } else {
                            moduleSelect.disabled = false;
                        }
                    }

                    doSearch();
                });
            });

            // 模块下拉
            moduleSelect.addEventListener('change', () => {
                state.module = moduleSelect.value;
                doSearch();
            });

            // 搜索输入
            let debounceTimer;
            searchInput.addEventListener('input', () => {
                clearTimeout(debounceTimer);
                debounceTimer = setTimeout(() => {
                    state.query = searchInput.value;
                    doSearch();
                }, 150);
            });

            // Ctrl+K 清空
            searchInput.addEventListener('keydown', (e) => {
                if (e.ctrlKey && e.key === 'k') {
                    e.preventDefault();
                    searchInput.value = '';
                    state.query = '';
                    doSearch();
                }
            });

            // 搜索
            function doSearch() {
                vscode.postMessage({
                    type: 'search',
                    query: state.query,
                    version: state.version,
                    module: state.module,
                    kind: state.kind,
                });
            }

            // 打开详情
            function showDetail(name, sourceFile, sourceLine, kind) {
                vscode.postMessage({ type: 'showDetail', name, sourceFile, sourceLine, kind });
                searchView.classList.add('hidden');
                detailView.classList.remove('hidden');
                detailContent.innerHTML = '<div class="loading">加载中…</div>';
            }

            // 返回搜索
            detailBack.addEventListener('click', () => {
                detailView.classList.add('hidden');
                searchView.classList.remove('hidden');
            });

            // 渲染详情
            function renderDetail(d) {
                const kindLabel = { function: '函数', enum: '枚举', event: '事件' }[d.kind] || d.kind;
                const kindClass = { function: 'kind-function', enum: 'kind-enum', event: 'kind-event' }[d.kind] || '';
                const verClass = d.version === '2.0' ? 'version-2\\.0-tag' : 'version-3\\.0-tag';

                // 第 1 行：代码名
                let html = \`<div class="detail-name" style="font-family:var(--font-mono);font-weight:700;font-size:16px;color:var(--vscode-textLink-foreground,#3794ff);word-break:break-all;margin-bottom:6px">\${escapeHtml(d.name)}</div>\`;

                // 第 2 行：标签
                html += \`<div style="display:flex;align-items:center;gap:6px;flex-wrap:wrap;margin-bottom:8px">
                    <span class="result-kind \${kindClass}">\${kindLabel}</span>
                    <span class="result-version \${verClass}">\${d.version}</span>
                    <span style="font-size:11px;opacity:0.6">\${escapeHtml(d.module)}</span>
                </div>\`;

                // 第 3 行：描述（清除换行符）
                if (d.description) {
                    const cleanDesc = d.description.replace(/[\\r\\n]+/g, '');
                    html += \`<div class="detail-section"><div class="detail-desc">\${escapeHtml(cleanDesc)}</div></div>\`;
                }

                // 参数
                if (d.parameters && d.parameters.length > 0) {
                    html += \`<div class="detail-section">
                        <div class="detail-section-title">参数</div>
                        <div class="detail-grid">
                            <div class="grid-header"><span class="h-name">名称</span><span class="h-type">类型</span><span class="h-desc">说明</span></div>
                    \`;
                    for (const p of d.parameters) {
                        html += \`<div class="grid-row"><span class="grid-cell cell-name">\${escapeHtml(p.name)}</span><span class="grid-cell cell-type">\${escapeHtml(p.type)}</span><span class="grid-cell cell-desc">\${escapeHtml(p.desc)}</span></div>\`;
                    }
                    html += \`</div></div>\`;
                }

                // 返回值
                if (d.returns && d.returns.length > 0) {
                    html += \`<div class="detail-section">
                        <div class="detail-section-title">返回值</div>
                        <div class="detail-grid">
                            <div class="grid-header"><span class="h-type">类型</span><span class="h-desc">说明</span></div>
                    \`;
                    for (const r of d.returns) {
                        html += \`<div class="grid-row"><span class="grid-cell cell-type">\${escapeHtml(r.type)}</span><span class="grid-cell cell-desc">\${escapeHtml(r.desc)}</span></div>\`;
                    }
                    html += \`</div></div>\`;
                }

                // 字段（枚举/事件）
                if (d.fields && d.fields.length > 0) {
                    const fieldTitle = d.kind === 'event' ? '事件字段' : '枚举值';
                    html += \`<div class="detail-section">
                        <div class="detail-section-title">\${fieldTitle}</div>
                        <div class="detail-grid">
                            <div class="grid-header"><span class="h-name">名称</span><span class="h-type">类型</span><span class="h-desc">说明</span></div>
                    \`;
                    for (const f of d.fields) {
                        const fullName = d.name.includes('.') ? f.name : d.name + '.' + f.name;
                        html += \`<div class="grid-row"><span class="grid-cell cell-name">\${escapeHtml(fullName)}</span><span class="grid-cell cell-type">\${escapeHtml(f.type)}</span><span class="grid-cell cell-desc">\${escapeHtml(f.desc)}</span></div>\`;
                    }
                    html += \`</div></div>\`;
                }

                // 源文件
                html += \`<div class="detail-source">\${escapeHtml(d.sourceFile)} : \${d.sourceLine}</div>\`;

                detailContent.innerHTML = html;

                // 检测容器宽度，自动切换横排/竖排
                function adjustDetailLayout() {
                    const grids = detailContent.querySelectorAll('.detail-grid');
                    for (const grid of grids) {
                        const w = grid.offsetWidth;
                        const rows = grid.querySelectorAll('.grid-row');
                        const header = grid.querySelector('.grid-header');
                        if (w < 500) {
                            for (const row of rows) row.style.flexDirection = 'column';
                            if (header) header.style.display = 'none';
                        } else {
                            for (const row of rows) row.style.flexDirection = 'row';
                            if (header) header.style.display = '';
                        }
                    }
                }
                adjustDetailLayout();
                window.addEventListener('resize', adjustDetailLayout);
            }

            // 渲染分页控件
            function renderPagination() {
                const total = state.allResults.length;
                const pageSize = state.pageSize;
                const totalPages = Math.max(1, Math.ceil(total / pageSize));
                const page = state.currentPage;

                if (total <= pageSize) {
                    paginationEl.innerHTML = '';
                    return;
                }

                let html = '';
                // 上一页
                html += \`<button class="page-prev" \${page <= 1 ? 'disabled' : ''}>◀ 上一页</button>\`;

                // 页码信息 + 输入框
                html += \`<span class="page-info">第</span>\`;
                html += \`<input type="number" class="page-input" id="pageInput" value="\${page}" min="1" max="\${totalPages}" />\`;
                html += \`<span class="page-info">/ \${totalPages} 页</span>\`;

                // 下一页
                html += \`<button class="page-next" \${page >= totalPages ? 'disabled' : ''}>下一页 ▶</button>\`;

                paginationEl.innerHTML = html;

                // 绑定事件
                const prevBtn = paginationEl.querySelector('.page-prev');
                const nextBtn = paginationEl.querySelector('.page-next');
                const pageInput = paginationEl.querySelector('.page-input');

                prevBtn.addEventListener('click', () => {
                    if (state.currentPage > 1) {
                        state.currentPage--;
                        renderCurrentPage();
                    }
                });
                nextBtn.addEventListener('click', () => {
                    if (state.currentPage < totalPages) {
                        state.currentPage++;
                        renderCurrentPage();
                    }
                });
                pageInput.addEventListener('change', () => {
                    let p = parseInt(pageInput.value, 10);
                    if (isNaN(p) || p < 1) {p = 1;}
                    if (p > totalPages) {p = totalPages;}
                    state.currentPage = p;
                    pageInput.value = p;
                    renderCurrentPage();
                });
                pageInput.addEventListener('keydown', (e) => {
                    if (e.key === 'Enter') {
                        pageInput.dispatchEvent(new Event('change'));
                    }
                });
            }

            // 渲染当前页
            function renderCurrentPage() {
                // 切页时滚动到顶部
                searchView.scrollIntoView({ behavior: 'smooth', block: 'start' });

                const total = state.allResults.length;
                const pageSize = state.pageSize;
                const totalPages = Math.max(1, Math.ceil(total / pageSize));
                const page = state.currentPage;

                const start = (page - 1) * pageSize;
                const end = Math.min(start + pageSize, total);
                const pageItems = state.allResults.slice(start, end);

                statsEl.textContent = \`\${end} / \${total} 条结果\`;

                resultsEl.innerHTML = '';
                for (const item of pageItems) {
                    const card = document.createElement('div');
                    card.className = \`result-item version-\${item.version.replace('.', '\\\\.')}\`;

                    const kindLabel = { function: '函数', enum: '枚举', event: '事件' }[item.kind] || item.kind;

                    let metaParts = [];
                    if (item.kind === 'function') {
                        if (item.paramCount > 0) metaParts.push(\`\${item.paramCount} 参数\`);
                        if (item.returnCount > 0) metaParts.push(\`\${item.returnCount} 返回值\`);
                    } else if (item.kind === 'enum' || item.kind === 'event') {
                        if (item.fieldCount > 0) metaParts.push(\`\${item.fieldCount} 字段\`);
                    }

                    const paramsPreview = item.parameters.length > 0
                        ? item.parameters.map(p => \`<code>\${p.name}: \${p.type}</code>\`).join(', ')
                        : '';

                    card.innerHTML = \`
                        <div class="result-header">
                            <span class="result-name">\${item.name}</span>
                        </div>
                        <div class="result-tags">
                            <span class="result-kind kind-\${item.kind}">\${kindLabel}</span>
                            <span class="result-version version-\${item.version}-tag">\${item.version}</span>
                            <span class="result-module">\${item.module}</span>
                        </div>
                        \${item.description ? '<div class="result-desc">' + escapeHtml(item.description) + '</div>' : ''}
                        \${paramsPreview ? '<div class="result-meta">参数: ' + paramsPreview + '</div>' : ''}
                        \${metaParts.length > 0 ? '<div class="result-meta">' + metaParts.join(' · ') + '</div>' : ''}
                    \`;

                    card.addEventListener('click', () => showDetail(item.name, item.sourceFile, item.sourceLine, item.kind));
                    resultsEl.appendChild(card);
                }

                renderPagination();
            }

            // 渲染结果
            function renderResults(data) {
                loadingEl.classList.add('hidden');

                if (data.results.length === 0) {
                    resultsEl.innerHTML = \`
                        <div class="empty">
                            <div class="title">🔍 未找到匹配结果</div>
                            <div>尝试使用更短的搜索词，或调整筛选条件</div>
                        </div>
                    \`;
                    paginationEl.innerHTML = '';
                    statsEl.textContent = data.totalCount + ' 条 API · 无匹配结果';
                    state.allResults = [];
                    return;
                }

                // 保存全部结果，重置到第一页
                state.allResults = data.results;
                state.currentPage = 1;
                renderCurrentPage();
            }

            function escapeHtml(str) {
                const div = document.createElement('div');
                div.textContent = str;
                return div.innerHTML;
            }

            // 接收消息
            window.addEventListener('message', event => {
                const msg = event.data;
                switch (msg.type) {
                    case 'initData':
                        state.modules20 = msg.modules20;
                        state.modules30 = msg.modules30;
                        // 根据当前版本筛选填充模块下拉
                        updateModuleOptions(state.version);
                        state.totalCount = msg.counts.total;

                        // 更新统计
                        const c = msg.counts;
                        statsEl.textContent = \`\${c.total} 条 API（函数 \${c.func} · 枚举 \${c.enum} · 事件 \${c.event}）\`;
                        loadingEl.classList.add('hidden');

                        // 初始搜索
                        doSearch();
                        break;

                    case 'searchResults':
                        renderResults(msg);
                        break;
                    case 'detailResult':
                        if (msg.error) {
                            detailContent.innerHTML = '<div class="empty"><div class="title">⚠️ ' + escapeHtml(msg.error) + '</div></div>';
                        } else {
                            renderDetail(msg.detail);
                        }
                        break;
                }
            });

            // 通知扩展已就绪
            vscode.postMessage({ type: 'ready' });
        })();
    </script>
</body>
</html>`;
    }
}

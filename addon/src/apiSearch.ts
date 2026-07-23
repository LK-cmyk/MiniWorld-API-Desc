import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';
import * as crypto from 'crypto';
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
    // 负向前瞻：值部分允许逗号，仅在遇到 ", key:" 模式时停止
    const paramRegex = /(\w[\w.]*)\s*:\s*((?:(?!\s*,\s*\w[\w.]*\s*:).)*?)(?=\s*,\s*\w[\w.]*\s*:|$)/g;
    let m: RegExpExecArray | null;
    while ((m = paramRegex.exec(paramsStr)) !== null) {
        eventInfo[m[1].trim()] = m[2].trim();
    }

    return { cleanDesc: cleanDesc || raw, eventInfo: Object.keys(eventInfo).length > 0 ? eventInfo : null };
}

/**
 * 从 `.d.lua` 文件中解析出所有 API 条目
 */
async function parseLuaDeclarations(filePath: string, version: '2.0' | '3.0'): Promise<ApiItem[]> {
    const items: ApiItem[] = [];
    const content = await fs.promises.readFile(filePath, 'utf-8');
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
                const fieldMatch = lines[j].match(/^---\s*@field (\w+)\s+(\w+)(?:\s*@([\s\S]*))?$/);
                if (fieldMatch) {
                    const rawDesc = fieldMatch[3] ? fieldMatch[3].trim() : '';
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

                // @param name type  (无描述)
                const paramSimple = commentLine.match(/^---\s*@param (\w+)\s+(\w+(?:\s*\|\s*\w+)*)$/);
                if (paramSimple) {
                    params.unshift({
                        name: paramSimple[1],
                        type: paramSimple[2],
                        desc: '',
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
                    const descLine = descMatch[1].trim();
                    description = descLine + (description ? '\n' + description : '');
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
async function scanAllApis(multipleDir: string): Promise<ApiItem[]> {
    const all: ApiItem[] = [];

    for (const version of ['2.0', '3.0'] as const) {
        const dir = path.join(multipleDir, version);
        try {
            await fs.promises.access(dir);
        } catch {
            continue;
        }
        const files = (await fs.promises.readdir(dir)).filter(f => f.endsWith('.d.lua') || f.endsWith('.lua'));
        for (const file of files) {
            const filePath = path.join(dir, file);
            try {
                const items = await parseLuaDeclarations(filePath, version);
                all.push(...items);
            } catch (err) {
                console.warn(`解析失败: ${filePath}`, err);
            }
        }

        // 额外解析 2.0 的 MNEvent.d.json（该文件仅 2.0 目录下有）
        const jsonEventPath = path.join(dir, 'MNEvent.d.json');
        try {
            await fs.promises.access(jsonEventPath);
            const items = await parseJsonEvents(jsonEventPath, version);
            all.push(...items);
        } catch (err) {
            // ENOENT 表示文件不存在（3.0 目录），这不是错误，静默跳过
            if ((err as NodeJS.ErrnoException).code !== 'ENOENT') {
                console.warn(`解析失败: ${jsonEventPath}`, err);
            }
        }
    }

    return all;
}

/**
 * 构建类型引用映射：找出哪些类（如 CurEventParam）通过 @field 引用了其他类（如 EventDate）
 * 用于在搜索结果中显示完整路径名称，如 CurEventParam.EventDate.hour
 */
function buildTypeRefMap(items: ApiItem[]): Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>> {
    const refMap = new Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>>();

    // 预构建索引：sourceFile → (name → item)，将 O(n²) 降为 O(n)
    const sourceIndex = new Map<string, Map<string, ApiItem>>();
    for (const item of items) {
        if (item.fields.length === 0) { continue; }
        let nameMap = sourceIndex.get(item.sourceFile);
        if (!nameMap) {
            nameMap = new Map();
            sourceIndex.set(item.sourceFile, nameMap);
        }
        nameMap.set(item.name, item);
    }

    for (const item of items) {
        if (item.kind !== 'enum' && item.kind !== 'event') { continue; }
        if (item.fields.length === 0) { continue; }

        const nameMap = sourceIndex.get(item.sourceFile);
        if (!nameMap) { continue; }

        for (const field of item.fields) {
            // 检查 field.type 是否匹配另一个同文件中的条目名称（且该条目也有子字段）
            const referenced = nameMap.get(field.type);
            if (referenced) {
                if (!refMap.has(field.type)) {
                    refMap.set(field.type, []);
                }
                refMap.get(field.type)!.push({
                    parentName: item.name,
                    fieldName: field.name,
                    sourceFile: item.sourceFile,
                });
            }
        }
    }

    return refMap;
}

/**
 * 解析事件 JSON 文件（如 2.0 的 MNEvent.d.json）
 * 按第二个点号前的部分分组，如 "Game.AnyPlayer.EnterGame" → 组名 "Game.AnyPlayer"
 */
async function parseJsonEvents(filePath: string, version: '2.0' | '3.0'): Promise<ApiItem[]> {
    const items: ApiItem[] = [];
    const raw = await fs.promises.readFile(filePath, 'utf-8');
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

/** Fuse 实例缓存 key = items 引用 + filter 组合，仅在过滤条件或数据源变化时重建索引 */
const _fuseCache = new Map<string, { fuse: Fuse<ApiItem>; itemsRef: ApiItem[] }>();

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

    // 从缓存获取或新建 Fuse 实例（避免每次按键都重建索引）
    const cacheKey = `${versionFilter}|${moduleFilter}|${kindFilter}`;
    let fuse: Fuse<ApiItem>;
    const cached = _fuseCache.get(cacheKey);
    if (cached && cached.itemsRef === items) {
        fuse = cached.fuse;
    } else {
        fuse = new Fuse(filtered, {
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
        _fuseCache.set(cacheKey, { fuse, itemsRef: items });
    }

    const fuseResults = fuse.search(q);
    const results = fuseResults.map(r => r.item);

    return { results, totalCount: results.length };
}

// Webview View Provider

export class ApiSearchProvider implements vscode.WebviewViewProvider {
    public static readonly viewType = 'miniworld.apiSearchView';
    private _view?: vscode.WebviewView;
    private _allItems: ApiItem[] = [];
    private _initialized = false;
    /** 类型引用映射：子类型名 → { 父类名, 字段名, 源文件 } */
    private _typeRefMap: Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>> = new Map();
    private _context: vscode.ExtensionContext;

    constructor(
        private readonly _extensionUri: vscode.Uri,
        context: vscode.ExtensionContext,
    ) {
        // 构造函数中不执行同步 I/O，改为异步延迟加载
        this._context = context;
    }

    /** 异步初始化，加载并解析所有 API 数据 */
    public async init(): Promise<void> {
        if (this._initialized) { return; }
        const multipleDir = this._context.asAbsolutePath(path.join('multiple'));
        try {
            this._allItems = await scanAllApis(multipleDir);
            this._typeRefMap = buildTypeRefMap(this._allItems);
        } catch (err) {
            console.error('API 数据加载失败，下次 init() 会重试', err);
            this._allItems = [];
            this._typeRefMap = new Map();
            return; // 失败时不标记 _initialized，后续调用可重试
        }
        this._initialized = true;
    }

    /** 刷新数据（用于重新加载） */
    public async refresh(): Promise<void> {
        const baseDir = this._context.asAbsolutePath(path.join('multiple'));
        try {
            await fs.promises.access(baseDir);
            this._allItems = await scanAllApis(baseDir);
            _fuseCache.clear();
            this._typeRefMap = buildTypeRefMap(this._allItems);
            this._initialized = true;
            if (this._view) {
                this._sendInitData();
            }
        } catch (err) {
            console.error('refresh 失败，保留旧数据', err);
            if (this._view) {
                this._view.webview.postMessage({
                    type: 'loadError',
                    message: 'API 数据刷新失败，已保留上次的数据',
                });
            }
        }
    }

    async resolveWebviewView(
        webviewView: vscode.WebviewView,
        _context: vscode.WebviewViewResolveContext,
        _token: vscode.CancellationToken,
    ): Promise<void> {
        this._view = webviewView;

        // 确保数据已加载
        await this.init();

        webviewView.webview.options = {
            enableScripts: true,
            localResourceRoots: [
                vscode.Uri.joinPath(this._extensionUri, 'node_modules'),
                vscode.Uri.joinPath(this._extensionUri, 'multiple'),
                vscode.Uri.joinPath(this._extensionUri, 'addon', 'webview'),
            ],
        };

        webviewView.webview.html = await this._getHtmlContent(webviewView.webview);

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
        let { results } = searchItems(this._allItems, query, version, module, kind);
        const q = query.trim().toLowerCase();

        // 对于点号分隔的查询（如 "EventDate.hour"），fuse.js 的模糊匹配无法将长查询
        // 匹配到字段名较短的条目上，导致 CurEventParam / EventDate 等条目丢失。
        // 此处补充搜索：找出字段名/描述匹配任一查询片段的条目。
        const querySegments = q ? q.split('.').filter(Boolean) : [];
        if (querySegments.length > 1) {
            const seenKeys = new Set(results.map(r => `${r.name}:${r.sourceFile}:${r.sourceLine}`));
            const additional: ApiItem[] = [];
            for (const item of this._allItems) {
                const key = `${item.name}:${item.sourceFile}:${item.sourceLine}`;
                if (seenKeys.has(key)) { continue; }
                // 应用筛选条件
                if (version !== 'all' && item.version !== version) { continue; }
                if (module !== 'all' && item.module !== module) { continue; }
                if (kind !== 'all' && item.kind !== kind) { continue; }
                // 检查字段名/描述是否匹配任一查询片段
                if (item.fields.some(f => {
                    const ln = f.name.toLowerCase();
                    const ld = f.desc.toLowerCase();
                    return querySegments.some(s => ln.includes(s) || ld.includes(s));
                })) {
                    additional.push(item);
                }
            }
            if (additional.length > 0) {
                results = [...results, ...additional];
            }
        }

        // 将枚举/事件的字段展开为单独条目
        let expanded: Array<{
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

                // 检查当前类型是否被其他类通过 @field 引用（如 EventDate 被 CurEventParam 引用）
                const parents = this._typeRefMap.get(item.name);
                const parentRef = parents?.find(p => p.sourceFile === item.sourceFile);

                // 将查询按点号拆分为多个片段，支持逐段匹配（如 "EventDate.hour" 匹配 hour 字段）
                const querySegments = q ? q.split('.').filter(Boolean) : [];

                for (const field of item.fields) {
                    // 有搜索词时只包含匹配的字段（简单字符级模糊匹配）
                    const lowerFieldName = field.name.toLowerCase();
                    const lowerFieldDesc = field.desc.toLowerCase();
                    if (q && !lowerFieldName.includes(q) && !lowerFieldDesc.includes(q)) {
                        // 对于点号分隔的查询，检查是否任一字段名片段匹配
                        const segmentMatch = querySegments.some(seg =>
                            lowerFieldName.includes(seg) || lowerFieldDesc.includes(seg)
                        );
                        if (!segmentMatch) {
                            continue;
                        }
                    }
                    matchedAnyField = true;

                    // 如果该类型是子结构（被父类引用），使用父路径作为前缀
                    // 如 EventDate.hour → CurEventParam.EventDate.hour
                    const prefix = parentRef
                        ? `${parentRef.parentName}.${parentRef.fieldName}`
                        : item.name;

                    expanded.push({
                        name: `${prefix}.${field.name}`,
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
                // 以及被父类引用的子结构类型（如 EventDate）
                if (!matchedAnyField && !hiddenEventParents.has(item.name) && !parentRef) {
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

        // 过滤冗余的中间父级路径：若同时存在 "A.B" 和 "A.B.C"，则 "A.B" 是冗余的
        // 利用排序后前缀相邻的特性将 O(n²) 降为 O(n log n)
        if (expanded.length > 1) {
            const sorted = [...expanded].sort((a, b) => a.name.localeCompare(b.name));
            const filtered: typeof expanded = [];
            for (let i = 0; i < sorted.length; i++) {
                const cur = sorted[i];
                // 如果下一个条目以 cur.name + '.' 开头，则 cur 是冗余前缀
                const next = sorted[i + 1];
                if (!next || !next.name.startsWith(cur.name + '.')) {
                    filtered.push(cur);
                }
            }
            expanded = filtered;
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
                let parentName = msg.name.substring(0, dotIdx);
                let fieldName = msg.name.substring(dotIdx + 1);
                let parent = this._allItems.find(i => i.name === parentName && i.sourceFile === msg.sourceFile);

                // 处理嵌套路径如 CurEventParam.EventDate.hour → 取倒数第二段作为类名
                if (!parent) {
                    const parts = msg.name.split('.');
                    if (parts.length >= 3) {
                        parentName = parts[parts.length - 2];
                        fieldName = parts[parts.length - 1];
                        parent = this._allItems.find(i => i.name === parentName && i.sourceFile === msg.sourceFile);
                    }
                }

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
            // 单个展开的字段条目（如 EventDate.hour）
            // 始终展示字段本身的名称、类型和描述
            detailFields = [{
                name: fieldDetail.name,
                type: fieldDetail.type.startsWith('event|') ? 'event' : fieldDetail.type,
                desc: fieldDetail.desc,
            }];
            // 如果是事件类型，额外展开子参数
            if (fieldDetail.type.startsWith('event|')) {
                try {
                    const eventInfo = JSON.parse(fieldDetail.type.substring(6));
                    for (const [pn, pd] of Object.entries(eventInfo)) {
                        detailFields.push({ name: `  ${pn}`, type: 'any', desc: pd as string });
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
        return crypto.randomBytes(48).toString('base64url');
    }

    private async _getHtmlContent(webview: vscode.Webview): Promise<string> {
        const nonce = this._getNonce();

        const webviewDir = vscode.Uri.joinPath(this._extensionUri, 'addon', 'webview');
        const cssUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'style.css'));
        const scriptUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'script.js'));

        // 异步读取 SVG 图标文件，直接内联为 <svg> 元素（零外部依赖、无 CSP 问题）
        const iconDir = path.join(this._extensionUri.fsPath, 'addon', 'webview', 'assets', 'img');
        const readSvg = async (name: string): Promise<string> => {
            const filePath = path.join(iconDir, name);
            try {
                return (await fs.promises.readFile(filePath, 'utf-8')).trim();
            } catch {
                return '';
            }
        };
        const [searchSvg, closeSvg, copySvg, checkSvg] = await Promise.all([
            readSvg('search.svg'),
            readSvg('close.svg'),
            readSvg('copy.svg'),
            readSvg('check.svg'),
        ]);

        // SVG 的 HTML 转义版本（用于 data-* 属性，避免双引号破坏属性结构）
        const escHtml = (s: string) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        const copySvgAttr = escHtml(copySvg);
        const checkSvgAttr = escHtml(checkSvg);
        const searchSvgAttr = escHtml(searchSvg);

        // 异步读取 marked 库并内联到 HTML 中
        const markedPath = path.join(this._extensionUri.fsPath, 'node_modules', 'marked', 'lib', 'marked.umd.js');
        let markedScript = '';
        try {
            markedScript = await fs.promises.readFile(markedPath, 'utf-8');
        } catch {
            console.warn('marked 库未找到，将使用降级方案');
            // 降级方案：提供一个空的 marked polyfill
            markedScript = 'window.marked={parse:function(t){return t},parseInline:function(t){return t}};';
        }

        const htmlPath = vscode.Uri.joinPath(webviewDir, 'search.html');
        let html = await fs.promises.readFile(htmlPath.fsPath, 'utf-8');

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

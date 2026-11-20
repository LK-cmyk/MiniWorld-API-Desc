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
    /** 类名前缀（如 Player:getPos 的 "Player"），undefined 表示非类方法 */
    className?: string;
}

/** ID 数据条目 */
export interface IdEntry {
    name: string;
    desc?: string;
}
/** ID → { name, desc } */
export type IdMap = Record<string, IdEntry>;
/** ID 分类：item=道具 / actor=生物 / buff=状态 */
export type IdCategory = 'item' | 'actor' | 'buff';
/** 分类 → ID 映射 */
export type IdCategories = Record<IdCategory, IdMap>;

/** ID 数据缓存有效期：10 天 */
const ID_CACHE_TTL_MS = 10 * 24 * 60 * 60 * 1000;
/** Worker 上可下载的 ID 分类 */
const ID_DOWNLOAD_TYPES: IdCategory[] = ['item', 'actor', 'buff'];

// 模块级正则常量（避免热路径中重复创建 RegExp）
const RE_CLASS_LINE = /^---\s*@class (\w+)\s*@?(.*)$/;
// 类型可能是 `any`、`EventInfo.TriggerEvent.GameStart`、`fun(event: T)`、`table {x: number}` 等，
// 统一按「非空白字符 + 可选说明」解析，避免带点号/函数签名/结构体的类型被漏掉。
const RE_FIELD_LINE = /^---\s*@field (\w+)\s+(\S+)(?:\s+@([\s\S]*))?$/;
const RE_OTHER_ANNOTATION = /^---\s*@/;
const RE_FUNC_LINE = /(?:function\s+(?:(\w+):)?(\w+)\s*\(|(\w+)\s*=\s*function\s*\()/;
const RE_PARAM_FULL = /^---\s*@param (\w+)\s+(.+?)\s+@(.+)$/;
const RE_PARAM_SIMPLE = /^---\s*@param (\w+)\s+(.+)$/;
const RE_RETURN_FULL = /^---\s*@return (.+?)\s+@(.+)$/;
const RE_RETURN_SIMPLE = /^---\s*@return (.+)$/;
const RE_DESC_LINE = /^--- (.+)$/;

// 模块级常量集合（避免每次搜索都新建 Set）
const EXCLUDED_MODULES = new Set(['Event', 'EnumLib']);
const HIDDEN_EVENT_PARENTS = new Set(['TriggerEvent', 'CurEventParam', 'ObjectEvent']);
/** 共享只读空数组（避免每个展开条目都分配新数组） */
const EMPTY_PARAMS: readonly ApiParam[] = Object.freeze([]);
const EMPTY_RETURNS: readonly ApiReturn[] = Object.freeze([]);
const EMPTY_FIELDS: readonly ApiField[] = Object.freeze([]);

/** Fuse 实例缓存上限（LRU） */
const FUSE_CACHE_MAX = 6;

// 解析器

/**
 * 解析事件字段描述中的参数信息
 * 格式：描述文本 {param1:说明, param2:说明, ...}
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

    // 参数形如 `blockid:方块类型, x,y,z:事件位置`；分组名共享同一个说明
    const paramRegex = /([A-Za-z_]\w*(?:\s*,\s*[A-Za-z_]\w*)*)\s*:\s*([^,]*)/g;
    let m: RegExpExecArray | null;
    while ((m = paramRegex.exec(paramsStr)) !== null) {
        const desc = m[2].trim();
        for (const name of m[1].split(',')) {
            const trimmed = name.trim();
            if (trimmed) {
                eventInfo[trimmed] = desc;
            }
        }
    }

    return { cleanDesc: cleanDesc || raw, eventInfo: Object.keys(eventInfo).length > 0 ? eventInfo : null };
}

/** 从 `.d.lua` 文件解析出所有 API 条目 */
export async function parseLuaDeclarations(filePath: string, version: '2.0' | '3.0'): Promise<ApiItem[]> {
    const items: ApiItem[] = [];
    const content = await fs.promises.readFile(filePath, 'utf-8');
    const lines = content.split(/\r?\n/);
    const baseName = path.basename(filePath);
    // 去掉前缀 "MN" 和后缀，作为模块名
    const moduleName = baseName.replace(/\.d\.lua$/, '').replace(/^MN/, '');

    // 解析枚举 / 事件（@class 块下的 @field）
    const isEventFile = baseName === 'MNEvent.d.lua';
    let i = 0;
    while (i < lines.length) {
        const classMatch = lines[i].match(RE_CLASS_LINE);
        if (classMatch) {
            const enumName = classMatch[1];
            const classDesc = classMatch[2].trim();
            const fields: ApiField[] = [];
            let j = i + 1;
            while (j < lines.length) {
                const fieldMatch = lines[j].match(RE_FIELD_LINE);
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
                } else if (RE_OTHER_ANNOTATION.test(lines[j].trim())) {
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
    i = 0;
    while (i < lines.length) {
        const line = lines[i];
        const funcMatch = line.match(RE_FUNC_LINE);
        if (funcMatch) {
            const className = funcMatch[1]; // 类名（如 Player: 中的 Player）
            const funcName = funcMatch[2] || funcMatch[3];
            if (!funcName || funcName === 'function') { i++; continue; }

            let description = '';
            const params: ApiParam[] = [];
            const returns: ApiReturn[] = [];

            // 向上收集注释
            let j = i - 1;
            while (j >= 0 && lines[j].trim().startsWith('---')) {
                const commentLine = lines[j].trim();

                const paramMatch = commentLine.match(RE_PARAM_FULL);
                if (paramMatch) {
                    params.unshift({
                        name: paramMatch[1],
                        type: paramMatch[2],
                        desc: paramMatch[3].trim(),
                    });
                    j--;
                    continue;
                }

                const paramSimple = commentLine.match(RE_PARAM_SIMPLE);
                if (paramSimple) {
                    params.unshift({
                        name: paramSimple[1],
                        type: paramSimple[2],
                        desc: '',
                    });
                    j--;
                    continue;
                }

                const returnMatch = commentLine.match(RE_RETURN_FULL);
                if (returnMatch) {
                    returns.unshift({
                        type: returnMatch[1],
                        desc: returnMatch[2].trim(),
                    });
                    j--;
                    continue;
                }

                const returnSimple = commentLine.match(RE_RETURN_SIMPLE);
                if (returnSimple) {
                    returns.unshift({ type: returnSimple[1], desc: '' });
                    j--;
                    continue;
                }

                // 纯描述行（自下而上遍历，向前插入以保持顺序）
                const descMatch = commentLine.match(RE_DESC_LINE);
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

/** 扫描整个目录，解析所有 API */
async function scanAllApis(multipleDir: string): Promise<ApiItem[]> {
    const all: ApiItem[] = [];

    for (const version of ['2.0', '3.0'] as const) {
        const dir = path.join(multipleDir, version);
        try {
            await fs.promises.access(dir);
        } catch {
            continue;
        }
        // MNEventTable.d.lua 只是给 LuaLS 用的事件回调参数表，不是 API 文档，不进侧栏索引
        const files = (await fs.promises.readdir(dir))
            .filter(f => (f.endsWith('.d.lua') || f.endsWith('.lua')) && f !== 'MNEventTable.d.lua');
        for (const file of files) {
            const filePath = path.join(dir, file);
            try {
                const items = await parseLuaDeclarations(filePath, version);
                for (const it of items) { all.push(it); }
            } catch (err) {
                console.warn(`解析失败: ${filePath}`, err);
            }
        }

        // 额外解析 MNEvent.d.json（仅 2.0 目录下有）
        const jsonEventPath = path.join(dir, 'MNEvent.d.json');
        try {
            await fs.promises.access(jsonEventPath);
            const items = await parseJsonEvents(jsonEventPath, version);
            for (const it of items) { all.push(it); }
        } catch (err) {
            // 3.0 目录无此文件，ENOENT 静默跳过
            if ((err as NodeJS.ErrnoException).code !== 'ENOENT') {
                console.warn(`解析失败: ${jsonEventPath}`, err);
            }
        }
    }

    return all;
}

/**
 * 构建类型引用映射：找出哪些类（如 CurEventParam）通过 @field 引用其他类（如 EventDate）
 * 用于显示完整路径名称，如 CurEventParam.EventDate.hour
 */
function buildTypeRefMap(items: ApiItem[]): Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>> {
    const refMap = new Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>>();

    // 预构建 sourceFile → (name → item) 索引，将 O(n²) 降为 O(n)
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
            // 检查 field.type 是否匹配同文件中的另一条目名（且该条目也有子字段）
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

/** 解析事件 JSON 文件（按第二个点号前的部分分组，如 "Game.AnyPlayer.EnterGame" → "Game.AnyPlayer"） */
async function parseJsonEvents(filePath: string, version: '2.0' | '3.0'): Promise<ApiItem[]> {
    const items: ApiItem[] = [];
    const raw = await fs.promises.readFile(filePath, 'utf-8');
    const parsed = JSON.parse(raw) as Record<string, { desc?: string; event_info?: Record<string, string> }>;

    // 按第二个点号前的部分分组
    const groups = new Map<string, {
        subEvents: Array<{ name: string; desc: string; event_info: Record<string, string> }>;
    }>();

    for (const [eventName, def] of Object.entries(parsed)) {
        const firstDot = eventName.indexOf('.');
        const secondDot = firstDot > 0 ? eventName.indexOf('.', firstDot + 1) : -1;

        // 仅 >=2 个点号才分组，否则保持扁平
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
        const dotIdx = groupName.indexOf('.');
        const module = dotIdx > 0 ? groupName.substring(0, dotIdx) : 'Event';

        // 将子事件数据以 event| 编码序列化到 field.type，供 detail 页使用
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

/** 构建事件详情字段列表，将 event| 编码的子事件参数展开为缩进条目 */
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

/** 单个搜索结果条目（展开 + 精简后的字段） */
interface ExpandedItem {
    name: string;
    kind: string;
    module: string;
    version: string;
    description: string;
    paramCount: number;
    returnCount: number;
    fieldCount: number;
    sourceFile: string;
    sourceLine: number;
    parameters: ApiParam[];
    returns: ApiReturn[];
    fields: ApiField[];
    displayName?: string;
}

/**
 * 使用 fuse.js 模糊搜索，支持多字段加权匹配
 * 注意：调用方负责传入已筛选的 items（已应用 version/module/kind 过滤）
 */
function searchItems(
    items: ApiItem[],
    query: string,
    versionFilter: string,
    moduleFilter: string,
    kindFilter: string,
    fuseCache: Map<string, { fuse: Fuse<ApiItem>; itemsRef: ApiItem[] }>,
): { results: ApiItem[]; filtered: ApiItem[] } {
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
            if (verA !== verB) { return verA - verB; }
            const modCmp = a.module.localeCompare(b.module);
            if (modCmp !== 0) { return modCmp; }
            return a.name.localeCompare(b.name);
        });
        return { results: filtered, filtered };
    }

    // 文本搜索：剥离尾部括号 ()（），如 getPos() → getPos
    const q = query.trim().toLowerCase().replace(/[（(]\s*[）)]?\s*$/, '');

    // 从缓存获取或新建 Fuse 实例（避免每次按键重建索引）
    const cacheKey = `${versionFilter}|${moduleFilter}|${kindFilter}`;
    let fuse: Fuse<ApiItem>;
    const cached = fuseCache.get(cacheKey);
    if (cached && cached.itemsRef === items) {
        fuse = cached.fuse;
        // LRU：刷新最近使用顺序
        fuseCache.delete(cacheKey);
        fuseCache.set(cacheKey, cached);
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
            // 不分配 score 包装对象，以节省 CPU
            includeScore: false,
            shouldSort: true,
            // 找到首匹配后短路，减少 CPU
            findAllMatches: false,
            // 允许匹配跨越字段任意位置，更适合 API 名搜索
            ignoreLocation: true,
        });
        // LRU 容量控制
        if (fuseCache.size >= FUSE_CACHE_MAX) {
            // 删除最早插入（最旧）的条目
            const oldestKey = fuseCache.keys().next().value;
            if (oldestKey !== undefined) { fuseCache.delete(oldestKey); }
        }
        fuseCache.set(cacheKey, { fuse, itemsRef: items });
    }

    const fuseResults = fuse.search(q);
    const results = fuseResults.map(r => r.item);

    return { results, filtered };
}

// Webview View Provider

export class ApiSearchProvider implements vscode.WebviewViewProvider, vscode.Disposable {
    public static readonly viewType = 'miniworld.apiSearchView';
    private _view?: vscode.WebviewView;
    private _allItems: ApiItem[] = [];
    private _initialized = false;
    /** 类型引用映射：子类型名 → { 父类名, 字段名, 源文件 } */
    private _typeRefMap: Map<string, Array<{ parentName: string; fieldName: string; sourceFile: string }>> = new Map();
    private _context: vscode.ExtensionContext;
    private _idMap: IdCategories = { item: {}, actor: {}, buff: {} };
    private _idDataLoaded = false;
    private _idError = '';
    /** ID 数据版本戳：仅当数据变化时才向 webview 重新推送 */
    private _idDataVersion = 0;
    /** webview 上次收到的 ID 数据版本 */
    private _lastSentIdVersion = -1;

    /** Fuse 实例缓存（实例级，避免模块级缓存永不释放） */
    private readonly _fuseCache = new Map<string, { fuse: Fuse<ApiItem>; itemsRef: ApiItem[] }>();

    /** 名称索引：key = `${name}\0${sourceFile}`，用于 O(1) 查找 */
    private _nameIndex: Map<string, ApiItem[]> = new Map();

    /** 最近一次完整搜索结果缓存（用于分页时跳过重算） */
    private _lastSearchKey: string | null = null;
    private _lastSearchResults: ExpandedItem[] = [];

    /** initData 中已推送过的 ID 数据版本，避免重复推送 */
    private _initDataSentIdVersion = -1;

    /** 资源缓存：marked.umd.js / SVG 内容 */
    private static _assetCache: {
        extensionPath: string;
        searchSvg: string;
        closeSvg: string;
        copySvg: string;
        checkSvg: string;
        markedScript: string;
        html: string;
    } | undefined;

    private readonly _disposables: vscode.Disposable[] = [];

    private _declarationsDir(): string {
        const bundledDir = path.resolve(this._context.extensionPath, 'declarations');
        return fs.existsSync(bundledDir) ? bundledDir : path.resolve(this._context.extensionPath, '..', 'declarations');
    }

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
        const multipleDir = this._declarationsDir();
        try {
            this._allItems = await scanAllApis(multipleDir);
            this._typeRefMap = buildTypeRefMap(this._allItems);
            this._buildNameIndex();
            // 数据已更新，失效搜索结果缓存，避免首次打开用空结果命中缓存
            this._lastSearchKey = null;
            this._lastSearchResults = [];
        } catch (err) {
            console.error('API 数据加载失败，下次 init() 会重试', err);
            this._allItems = [];
            this._typeRefMap = new Map();
            this._nameIndex = new Map();
            return; // 失败时不标记 _initialized，后续可重试
        }
        this._initialized = true;
        // 异步加载 ID 数据（失败不阻塞搜索）
        void this.loadIdData().then(() => {
            if (this._view) { this._sendIdData(); }
        });
    }

    /** 构建 name 索引：`${name}\0${sourceFile}` → 该位置的所有条目 */
    private _buildNameIndex(): void {
        const idx = new Map<string, ApiItem[]>();
        for (const it of this._allItems) {
            const key = `${it.name}\0${it.sourceFile}`;
            const arr = idx.get(key);
            if (arr) { arr.push(it); } else { idx.set(key, [it]); }
        }
        this._nameIndex = idx;
    }

    /** 刷新数据（用于重新加载） */
    public async refresh(): Promise<void> {
        const baseDir = this._declarationsDir();
        try {
            await fs.promises.access(baseDir);
            this._allItems = await scanAllApis(baseDir);
            this._fuseCache.clear();
            this._typeRefMap = buildTypeRefMap(this._allItems);
            this._buildNameIndex();
            this._lastSearchKey = null;
            this._lastSearchResults = [];
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
        // ID 数据：强制重新下载（失败不阻塞）
        await this.loadIdData(true);
        this._sendIdData();
    }

    /** 获取服务器地址设置 */
    private _getServerUrl(): string {
        const cfg = vscode.workspace.getConfiguration('miniworld');
        return (cfg.get<string>('serverUrl') || 'desc.cmyk.dpdns.org').trim();
    }

    private _idCacheFile(): vscode.Uri {
        return vscode.Uri.joinPath(this._context.globalStorageUri, 'id-cache.json');
    }

    /** 从服务器下载单个分类的 ID 数据 */
    private async _downloadIdData(serverUrl: string, type: string): Promise<IdMap> {
        const clean = serverUrl.replace(/\/+$/, '');
        const base = /^https?:\/\//i.test(clean) ? clean : `https://${clean}`;
        const url = `${base}/api/download?type=${type}`;
        const controller = new AbortController();
        const timer = setTimeout(() => controller.abort(), 10000);
        try {
            const resp = await fetch(url, { signal: controller.signal, headers: { Accept: 'application/json' } });
            if (!resp.ok) {
                throw new Error(`服务器返回 HTTP ${resp.status}`);
            }
            const data = (await resp.json()) as unknown;
            const map: IdMap = {};
            if (data && typeof data === 'object') {
                for (const [id, entry] of Object.entries(data as Record<string, unknown>)) {
                    const e = entry as { name?: unknown; desc?: unknown };
                    if (e && typeof e === 'object' && typeof e.name === 'string') {
                        const item: IdEntry = { name: e.name };
                        if (typeof e.desc === 'string') { item.desc = e.desc; }
                        map[id] = item;
                    }
                }
            }
            return map;
        } finally {
            clearTimeout(timer);
        }
    }

    /** 下载全部 ID 分类（单项失败不阻塞；全部失败则抛出） */
    private async _downloadAllIdData(serverUrl: string): Promise<IdCategories> {
        const results = await Promise.all(ID_DOWNLOAD_TYPES.map(async (type) => {
            try {
                return { type, map: await this._downloadIdData(serverUrl, type), ok: true };
            } catch {
                return { type, map: {} as IdMap, ok: false };
            }
        }));
        const categories = Object.fromEntries(results.map(r => [r.type, r.map])) as IdCategories;
        if (!results.some(r => r.ok)) {
            throw new Error('所有 ID 数据源均下载失败');
        }
        return categories;
    }

    /** 加载 ID 数据（优先 10 天缓存，过期/强制时重新下载） */
    public async loadIdData(force = false): Promise<void> {
        if (this._idDataLoaded && !force) { return; }
        const cacheFile = this._idCacheFile();
        try {
            if (!force) {
                try {
                    const raw = await fs.promises.readFile(cacheFile.fsPath, 'utf-8');
                    const cached = JSON.parse(raw) as { fetchedAt: string; data: IdCategories };
                    const cats = cached?.data;
                    if (cats && cats.item && cats.actor && cats.buff && cached.fetchedAt) {
                        const age = Date.now() - new Date(cached.fetchedAt).getTime();
                        if (age >= 0 && age < ID_CACHE_TTL_MS) {
                            this._idMap = { item: cats.item, actor: cats.actor, buff: cats.buff };
                            this._idDataLoaded = true;
                            this._idError = '';
                            this._idDataVersion++;
                            return;
                        }
                    }
                } catch { /* 缓存缺失或损坏，继续下载 */ }
            }
            const serverUrl = this._getServerUrl();
            const categories = await this._downloadAllIdData(serverUrl);
            this._idMap = categories;
            this._idDataLoaded = true;
            this._idError = '';
            this._idDataVersion++;
            await fs.promises.mkdir(this._context.globalStorageUri.fsPath, { recursive: true });
            await fs.promises.writeFile(cacheFile.fsPath, JSON.stringify({ fetchedAt: new Date().toISOString(), data: categories }), 'utf-8');
        } catch (err) {
            console.error('ID 数据加载失败', err);
            this._idError = err instanceof Error ? err.message : String(err);
            // 保留旧缓存数据（若有）
        }
    }

    /** 向 webview 推送 ID 数据（仅当版本变化时） */
    private _sendIdData(): void {
        if (this._lastSentIdVersion === this._idDataVersion) {
            return;
        }
        this._lastSentIdVersion = this._idDataVersion;
        this._view?.webview.postMessage({
            type: 'idData',
            data: this._idMap,
            error: this._idError || undefined,
            version: this._idDataVersion,
        });
    }

    /** 清空 ID 数据缓存并强制重新下载；成功返回 true */
    public async clearIdCache(): Promise<boolean> {
        this._idDataLoaded = false;
        this._idError = '';
        const cacheFile = this._idCacheFile();
        try {
            await fs.promises.unlink(cacheFile.fsPath);
        } catch { /* 缓存文件不存在也视为已清空 */ }
        await this.loadIdData(true);
        this._sendIdData();
        return !this._idError;
    }

    async resolveWebviewView(
        webviewView: vscode.WebviewView,
        _context: vscode.WebviewViewResolveContext,
        _token: vscode.CancellationToken,
    ): Promise<void> {
        this._view = webviewView;

        // 先设置 HTML 显示 loading，再异步初始化数据
        webviewView.webview.options = {
            enableScripts: true,
            localResourceRoots: [
                vscode.Uri.joinPath(this._extensionUri, 'node_modules'),
                vscode.Uri.file(this._declarationsDir()),
                vscode.Uri.joinPath(this._extensionUri, 'webview'),
            ],
        };

        webviewView.webview.html = await this._getHtmlContent(webviewView.webview);

        // 注册消息处理器
        const msgDisposable = webviewView.webview.onDidReceiveMessage(msg => this._onMessage(msg));
        this._disposables.push(msgDisposable);
        webviewView.onDidDispose(() => {
            msgDisposable.dispose();
            // 仅清理 view 引用，不清理数据（用户可能重新打开）
            this._view = undefined;
        });

        // 异步加载数据后推送 init 数据
        void this.init().then(() => {
            if (this._view) { this._sendInitData(); }
        });
    }

    private _onMessage(msg: any): void {
        switch (msg.type) {
            case 'ready':
                // init 未完成时不推送空数据，避免闪现“未找到匹配结果”；
                // init 完成后由 resolveWebviewView 的 init().then() 统一推送
                if (this._initialized) { this._sendInitData(); }
                break;
            case 'search':
                this._handleSearch(msg.query, msg.version, msg.module, msg.kind, msg.page ?? 1, msg.pageSize ?? 25);
                break;
            case 'showDetail':
                this._handleShowDetail(msg);
                break;
            case 'copy':
                vscode.env.clipboard.writeText(msg.text).then(() => {
                    vscode.window.showInformationMessage(`已复制: ${msg.text}`);
                });
                break;
            case 'getIds':
                // 仅在版本过期时重新推送
                this._sendIdData();
                break;
        }
    }

    private _sendInitData(): void {
        const modules20 = new Set<string>();
        const modules30 = new Set<string>();
        const counts = { total: this._allItems.length, func: 0, enum: 0, event: 0 };
        for (const item of this._allItems) {
            if (!EXCLUDED_MODULES.has(item.module)) {
                if (item.version === '2.0') { modules20.add(item.module); }
                else { modules30.add(item.module); }
            }
            if (item.kind === 'function') { counts.func++; }
            else if (item.kind === 'enum') { counts.enum++; }
            else if (item.kind === 'event') { counts.event++; }
        }

        const payload: any = {
            type: 'initData',
            modules20: Array.from(modules20).sort(),
            modules30: Array.from(modules30).sort(),
            counts,
        };
        // 仅当 ID 数据版本比上次推送更新时才附带 idData
        if (this._idDataVersion !== this._initDataSentIdVersion) {
            payload.idData = this._idMap;
            payload.idDataVersion = this._idDataVersion;
            this._initDataSentIdVersion = this._idDataVersion;
            this._lastSentIdVersion = this._idDataVersion; // 标记 webview 已收到
        }
        this._view?.webview.postMessage(payload);
    }

    /** 服务端分页搜索：仅向 webview 推送当前页的结果 */
    private _handleSearch(query: string, version: string, module: string, kind: string, page: number, pageSize: number): void {
        const searchKey = `${query}\0${version}\0${module}\0${kind}`;

        // 缓存命中：直接复用上次完整结果
        if (searchKey !== this._lastSearchKey) {
            this._lastSearchKey = searchKey;
            this._lastSearchResults = this._buildExpandedResults(query, version, module, kind);
        }

        const expanded = this._lastSearchResults;
        const totalCount = expanded.length;
        const totalPages = Math.max(1, Math.ceil(totalCount / pageSize));
        const safePage = Math.min(Math.max(1, page | 0), totalPages);
        const start = (safePage - 1) * pageSize;
        const end = Math.min(start + pageSize, totalCount);
        const pageItems = expanded.slice(start, end);

        this._view?.webview.postMessage({
            type: 'searchResults',
            results: pageItems,
            totalCount,
            page: safePage,
            totalPages,
            shownCount: pageItems.length,
        });
    }

    /** 执行完整搜索 + 展开 + 前缀去重，返回完整结果数组（调用方负责分页切片） */
    private _buildExpandedResults(query: string, version: string, module: string, kind: string): ExpandedItem[] {
        const { results } = searchItems(this._allItems, query, version, module, kind, this._fuseCache);
        const q = query.trim().toLowerCase();

        // 点号分隔的查询（如 "EventDate.hour"）无法被 fuse 直接匹配到字段名较短的条目，
        // 此处补充搜索：找出字段名/描述匹配任一查询片段的条目。
        const querySegments = q ? q.split('.').filter(Boolean) : [];
        let finalResults = results;
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
                finalResults = results.concat(additional);
            }
        }

        // 将枚举/事件的字段展开为单独条目
        let expanded: ExpandedItem[] = [];

        for (const item of finalResults) {
            // JSON 事件已按组名聚合，不展开子事件
            const isJsonEvent = item.sourceFile.endsWith('.json');

            if ((item.kind === 'enum' || item.kind === 'event') && item.fields.length > 0 && !isJsonEvent) {
                let matchedAnyField = false;

                // 检查当前类型是否被其他类通过 @field 引用（如 EventDate 被 CurEventParam 引用）
                const parents = this._typeRefMap.get(item.name);
                const parentRef = parents?.find(p => p.sourceFile === item.sourceFile);

                for (const field of item.fields) {
                    // 有搜索词时只包含匹配的字段（简单字符级模糊匹配）
                    const lowerFieldName = field.name.toLowerCase();
                    const lowerFieldDesc = field.desc.toLowerCase();
                    if (q && !lowerFieldName.includes(q) && !lowerFieldDesc.includes(q)) {
                        // 点号分隔查询：检查是否任一字段名片段匹配
                        const segmentMatch = querySegments.some(seg =>
                            lowerFieldName.includes(seg) || lowerFieldDesc.includes(seg)
                        );
                        if (!segmentMatch) {
                            continue;
                        }
                    }
                    matchedAnyField = true;

                    // 子结构类型（被父类引用）用父路径作为前缀，如 CurEventParam.EventDate.hour
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
                        parameters: EMPTY_PARAMS as ApiParam[],
                        returns: EMPTY_RETURNS as ApiReturn[],
                        fields: EMPTY_FIELDS as ApiField[],
                    });
                }
                // 字段全部被过滤时至少保留类本身，但隐藏事件父类（TriggerEvent 等）及被父类引用的子结构
                if (!matchedAnyField && !HIDDEN_EVENT_PARENTS.has(item.name) && !parentRef) {
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
                        parameters: EMPTY_PARAMS as ApiParam[],
                        returns: EMPTY_RETURNS as ApiReturn[],
                        fields: EMPTY_FIELDS as ApiField[],
                    });
                }
            } else if (!HIDDEN_EVENT_PARENTS.has(item.name)) {
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
                    // 简介仅展示前 5 个参数与前 3 个返回值
                    parameters: item.parameters.slice(0, 5),
                    returns: item.returns.slice(0, 3),
                    fields: EMPTY_FIELDS as ApiField[],
                });
            }
        }

        // 过滤冗余的中间父级路径：若同时存在 "A.B" 和 "A.B.C"，则 "A.B" 冗余
        if (expanded.length > 1) {
            expanded.sort((a, b) => a.name.localeCompare(b.name));
            const filtered: ExpandedItem[] = [];
            for (let i = 0; i < expanded.length; i++) {
                const cur = expanded[i];
                const next = expanded[i + 1];
                if (!next || !next.name.startsWith(cur.name + '.')) {
                    filtered.push(cur);
                }
            }
            return filtered;
        }

        return expanded;
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

        // 1. 精确匹配（name + sourceFile），进一步按 sourceLine 过滤
        const candidates = this._nameIndex.get(`${msg.name}\0${msg.sourceFile}`);
        let item: ApiItem | undefined = candidates?.find(i => i.sourceLine === msg.sourceLine);

        // 2. 用裸函数名再试（处理带模块前缀的函数名）
        if (!item && msg.kind === 'function') {
            const bareName = getBareName(msg.name, msg.kind);
            const bareCands = this._nameIndex.get(`${bareName}\0${msg.sourceFile}`);
            item = bareCands?.find(i => i.sourceLine === msg.sourceLine);
        }

        // 3. 精确匹配失败，按 name + sourceFile 取首个（JSON 事件行号均为 -1）
        if (!item && candidates && candidates.length > 0) {
            item = candidates[0];
        }

        // 4. 仍失败 → 可能是展开的字段条目（name 含 .），找到父类再取具体字段
        let fieldDetail: { name: string; type: string; desc: string } | undefined;
        if (!item) {
            const dotIdx = msg.name.lastIndexOf('.');
            if (dotIdx > 0) {
                let parentName = msg.name.substring(0, dotIdx);
                let fieldName = msg.name.substring(dotIdx + 1);
                let parentCands = this._nameIndex.get(`${parentName}\0${msg.sourceFile}`);
                let parent = parentCands?.[0];

                // 嵌套路径如 CurEventParam.EventDate.hour → 取倒数第二段作为类名
                if (!parent) {
                    const parts = msg.name.split('.');
                    if (parts.length >= 3) {
                        parentName = parts[parts.length - 2];
                        fieldName = parts[parts.length - 1];
                        parentCands = this._nameIndex.get(`${parentName}\0${msg.sourceFile}`);
                        parent = parentCands?.[0];
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
        const parameters = item.parameters;
        const returns = item.returns;
        const description = fieldDetail ? fieldDetail.desc : item.description;

        // 解码事件参数：JSON 分组事件或 3.0 事件都可能有 event| 编码的子事件数据
        const isEventSource = item.sourceFile.endsWith('.json') || item.sourceFile.endsWith('MNEvent.d.lua');
        let detailFields = item.fields;

        if (isEventSource && !fieldDetail) {
            // 对整个条目展开子事件列表及参数
            detailFields = buildEventDetailFields(item.fields);
        } else if (fieldDetail) {
            // 单个展开的字段条目：展示字段本身的名称、类型和描述
            detailFields = [{
                name: fieldDetail.name,
                type: fieldDetail.type.startsWith('event|') ? 'event' : fieldDetail.type,
                desc: fieldDetail.desc,
            }];
            // 事件类型额外展开子参数
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

    /**
     * 资源预加载：marked.umd.js + SVG + search.html。
     * 首次读取磁盘并缓存，后续直接复用，避免每次 webview 解析都重新读取。
     */
    private static async _loadAssets(extensionUri: vscode.Uri): Promise<NonNullable<typeof ApiSearchProvider._assetCache>> {
        if (ApiSearchProvider._assetCache && ApiSearchProvider._assetCache.extensionPath === extensionUri.fsPath) {
            return ApiSearchProvider._assetCache;
        }

        const webviewDir = vscode.Uri.joinPath(extensionUri, 'webview');
        const iconDir = path.join(extensionUri.fsPath, 'webview', 'assets', 'img');
        const markedPath = path.join(extensionUri.fsPath, 'node_modules', 'marked', 'lib', 'marked.umd.js');
        const htmlPath = vscode.Uri.joinPath(webviewDir, 'search.html');

        const readSvg = async (name: string): Promise<string> => {
            try {
                return (await fs.promises.readFile(path.join(iconDir, name), 'utf-8')).trim();
            } catch {
                return '';
            }
        };

        // 并行读取所有文件
        const [searchSvg, closeSvg, copySvg, checkSvg, markedScriptRead, htmlRead] = await Promise.all([
            readSvg('search.svg'),
            readSvg('close.svg'),
            readSvg('copy.svg'),
            readSvg('check.svg'),
            fs.promises.readFile(markedPath, 'utf-8').catch(() => 'window.marked={parse:function(t){return t},parseInline:function(t){return t}};'),
            fs.promises.readFile(htmlPath.fsPath, 'utf-8'),
        ]);

        ApiSearchProvider._assetCache = {
            extensionPath: extensionUri.fsPath,
            searchSvg,
            closeSvg,
            copySvg,
            checkSvg,
            markedScript: markedScriptRead,
            html: htmlRead,
        };
        return ApiSearchProvider._assetCache;
    }

    private async _getHtmlContent(webview: vscode.Webview): Promise<string> {
        const nonce = this._getNonce();
        const webviewDir = vscode.Uri.joinPath(this._extensionUri, 'webview');
        const cssUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'style.css'));
        const scriptUri = webview.asWebviewUri(vscode.Uri.joinPath(webviewDir, 'script.js'));

        const assets = await ApiSearchProvider._loadAssets(this._extensionUri);

        // SVG 的 HTML 转义版本（用于 data-* 属性，避免双引号破坏属性结构）
        const escHtml = (s: string) => s.replace(/&/g, '&amp;').replace(/"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
        const copySvgAttr = escHtml(assets.copySvg);
        const checkSvgAttr = escHtml(assets.checkSvg);
        const searchSvgAttr = escHtml(assets.searchSvg);

        let html = assets.html
            .replace(/\{\{nonce\}\}/g, nonce)
            .replace(/\{\{cspUri\}\}/g, webview.cspSource)
            .replace(/\{\{cssUri\}\}/g, cssUri.toString())
            .replace(/\{\{scriptUri\}\}/g, scriptUri.toString())
            // 直接内联 SVG（作为 DOM 元素）
            .replace(/\{\{searchSvg\}\}/g, assets.searchSvg)
            .replace(/\{\{closeSvg\}\}/g, assets.closeSvg)
            .replace(/\{\{copySvg\}\}/g, assets.copySvg)
            .replace(/\{\{checkSvg\}\}/g, assets.checkSvg)
            // HTML 转义版本（用于 data-* 属性）
            .replace(/\{\{copySvgAttr\}\}/g, copySvgAttr)
            .replace(/\{\{checkSvgAttr\}\}/g, checkSvgAttr)
            .replace(/\{\{searchSvgAttr\}\}/g, searchSvgAttr)
            .replace('</head>',
                `<script nonce="${nonce}">${assets.markedScript}</script>\n</head>`);

        return html;
    }

    /** 实现 Disposable 接口：清理所有资源 */
    public dispose(): void {
        for (const d of this._disposables) {
            try { d.dispose(); } catch { /* ignore */ }
        }
        this._disposables.length = 0;
        this._view = undefined;
        this._allItems = [];
        this._typeRefMap.clear();
        this._nameIndex.clear();
        this._fuseCache.clear();
        this._lastSearchKey = null;
        this._lastSearchResults = [];
    }
}

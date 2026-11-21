import * as vscode from 'vscode';

/**
 * 按文档版本缓存的轻量分析结果。
 *
 * 补全 / 悬浮 provider 会在用户每次输入 `.`/`:` 或移动鼠标时被反复调用。
 * 之前每个 provider 都各自调用 document.getText() 并全量扫描源码，
 * 一个输入事件可能触发多次重复扫描。这里把「取全文 + 行数组 + 派生结果」
 * 按 (uri, version) 缓存，同一版本只计算一次，文档变更后自动失效。
 */

interface DocSnapshot {
    version: number;
    source: string;
    lines: string[];
    /** 各 provider 的派生结果，按 key 区分 */
    slots: Map<string, unknown>;
}

/** 最多缓存的文档数，超出时淘汰最早插入的（避免长期不关的文档无限堆积） */
const MAX_DOCUMENTS = 64;

const snapshots = new Map<string, DocSnapshot>();

/** 取得文档当前版本的快照（同版本复用，跨版本重建） */
export function getSnapshot(document: vscode.TextDocument): DocSnapshot {
    const key = document.uri.toString();
    const cached = snapshots.get(key);
    if (cached && cached.version === document.version) {
        return cached;
    }

    const source = document.getText();
    const snapshot: DocSnapshot = {
        version: document.version,
        source,
        lines: source.split(/\r?\n/),
        slots: new Map(),
    };
    snapshots.set(key, snapshot);

    // 简单 LRU：超出上限时删除最早插入项
    if (snapshots.size > MAX_DOCUMENTS) {
        const oldest = snapshots.keys().next().value;
        if (oldest !== undefined) {
            snapshots.delete(oldest);
        }
    }
    return snapshot;
}

/**
 * 取缓存的派生结果；同版本内 factory 只执行一次。
 * T 由调用方保证与 key 对应。
 */
export function cached<T>(document: vscode.TextDocument, key: string, factory: (snapshot: DocSnapshot) => T): T {
    const snapshot = getSnapshot(document);
    if (snapshot.slots.has(key)) {
        return snapshot.slots.get(key) as T;
    }
    const value = factory(snapshot);
    snapshot.slots.set(key, value);
    return value;
}

/** 读取当前快照的源码（供需要原文的逻辑复用，避免重复 getText） */
export function sourceOf(document: vscode.TextDocument): string {
    return getSnapshot(document).source;
}

/** 读取当前快照的行数组 */
export function linesOf(document: vscode.TextDocument): string[] {
    return getSnapshot(document).lines;
}

/** 注册文档关闭时清理缓存，返回可释放的 Disposable */
export function registerCacheCleanup(): vscode.Disposable {
    return vscode.workspace.onDidCloseTextDocument(document => {
        snapshots.delete(document.uri.toString());
    });
}

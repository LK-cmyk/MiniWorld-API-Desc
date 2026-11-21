import * as fs from 'fs';
import * as path from 'path';
import * as vscode from 'vscode';

import {
    COMPLETION_MODE_SETTING,
    getCompletionMode,
    getEffectiveCompletionMode,
    getScopeValue,
    type CompletionMode,
} from './completionMode';

const LUA_CONFIG_SECTION = 'Lua';
const LIBRARY_KEY = 'workspace.library';

function getTypesDir20(context: vscode.ExtensionContext): string {
    const siblingDir = path.resolve(context.extensionPath, '..', 'declarations', '2.0');
    const bundledDir = path.resolve(context.extensionPath, 'declarations', '2.0');
    return fs.existsSync(bundledDir) ? bundledDir : siblingDir;
}

function getTypesDir30(context: vscode.ExtensionContext): string {
    const siblingDir = path.resolve(context.extensionPath, '..', 'declarations', '3.0');
    const bundledDir = path.resolve(context.extensionPath, 'declarations', '3.0');
    return fs.existsSync(bundledDir) ? bundledDir : siblingDir;
}

/** 规范化路径（解析相对路径、统一大小写），用于比较路径是否相同 */
function normalizePath(p: string): string {
    if (!path.isAbsolute(p)) {
        const folders = vscode.workspace.workspaceFolders;
        if (folders && folders.length > 0) {
            p = path.resolve(folders[0].uri.fsPath, p);
        }
    }
    return path.normalize(p).toLowerCase();
}

/** 作用域显示名称 */
function scopeLabel(target: vscode.ConfigurationTarget): string {
    switch (target) {
        case vscode.ConfigurationTarget.WorkspaceFolder:
            return '工作区文件夹';
        case vscode.ConfigurationTarget.Workspace:
            return '工作区';
        default:
            return '全局';
    }
}

/** 作用域优先级数值（越大优先级越高：工作区文件夹 > 工作区 > 全局） */
function scopePriority(target: vscode.ConfigurationTarget): number {
    switch (target) {
        case vscode.ConfigurationTarget.WorkspaceFolder:
            return 2;
        case vscode.ConfigurationTarget.Workspace:
            return 1;
        default:
            return 0;
    }
}

/** 从 inspect 结果中提取指定作用域的原始数组（复用共享的泛型取值） */
function getScopeArray(inspected: { globalValue?: string[]; workspaceValue?: string[]; workspaceFolderValue?: string[] } | undefined, target: vscode.ConfigurationTarget): string[] {
    return getScopeValue<string[]>(inspected, target) ?? [];
}

function arraysEqual(a: string[], b: string[]): boolean {
    return a.length === b.length && a.every((value, index) => value === b[index]);
}


/** 选择补全模式设置的作用域（始终列出工作区和全局） */
async function pickConfigurationTarget(version: '2.0' | '3.0'): Promise<vscode.ConfigurationTarget | undefined> {
    const config = vscode.workspace.getConfiguration();
    const inspected = config.inspect<string>(COMPLETION_MODE_SETTING);

    const globalDesc = inspected?.globalValue === version ? '当前已设置' : '应用于所有工作区';
    const workspaceDesc = inspected?.workspaceValue === version ? '当前已设置' : '保存到 .vscode/settings.json';

    interface ScopeItem extends vscode.QuickPickItem {
        target: vscode.ConfigurationTarget;
    }

    const items: ScopeItem[] = [
        { label: '工作区 (Workspace)', description: workspaceDesc, target: vscode.ConfigurationTarget.Workspace },
        { label: '全局 (Global)', description: globalDesc, target: vscode.ConfigurationTarget.Global },
    ];

    const selected = await vscode.window.showQuickPick(items, {
        placeHolder: `选择 UGC ${version} 补全模式的设置范围`,
        ignoreFocusOut: true,
    });

    return selected?.target;
}

/**
 * 迁移旧版本在 WorkspaceFolder 作用域设置的 miniworld.completion 到 Workspace 作用域，
 * 并清除所有 WorkspaceFolder 作用域中的残留值。
 * 仅在 Workspace 作用域未设置时才写入迁移值，避免覆盖用户已有的 Workspace 设置。
 */
async function migrateWorkspaceFolderSettings(): Promise<void> {
    const folders = vscode.workspace.workspaceFolders;
    if (!folders || folders.length === 0) {
        return;
    }

    const config = vscode.workspace.getConfiguration();
    const inspected = config.inspect<string>(COMPLETION_MODE_SETTING);
    const workspaceValue = inspected?.workspaceValue;

    // 收集所有 WorkspaceFolder 作用域中有效的 miniworld.completion 值
    let folderValueToMigrate: CompletionMode | undefined;
    const clearUpdates: Thenable<void>[] = [];

    for (const folder of folders) {
        const folderConfig = vscode.workspace.getConfiguration(undefined, folder);
        const folderInspected = folderConfig.inspect<string>(COMPLETION_MODE_SETTING);
        const val = folderInspected?.workspaceFolderValue;
        if (val === '2.0' || val === '3.0' || val === 'off') {
            if (folderValueToMigrate === undefined) {
                folderValueToMigrate = val;
            }
            clearUpdates.push(
                folderConfig.update(COMPLETION_MODE_SETTING, undefined, vscode.ConfigurationTarget.WorkspaceFolder)
            );
        }
    }

    if (folderValueToMigrate === undefined) {
        return; // WorkspaceFolder 作用域没有需要迁移的设置
    }

    // 仅在 Workspace 作用域未设置时才写入迁移值
    if (!workspaceValue) {
        await Promise.all([
            config.update(COMPLETION_MODE_SETTING, folderValueToMigrate, vscode.ConfigurationTarget.Workspace),
            ...clearUpdates,
        ]);
    } else {
        // Workspace 已有设置，仅清除 WorkspaceFolder 残留
        await Promise.all(clearUpdates);
    }
}


/**
 * 按补全模式自动应用声明配置（`miniworld.completion` 为唯一数据源）：
 * - '2.0' / '3.0'：将对应版本声明加载到 Lua 语言服务（仅写入全局作用域）
 * - 'off'：移除全局作用域中的 MiniWorld 声明
 * 同时清理工作区/工作区文件夹作用域中由旧版本插件写入的 `Lua.workspace.library` 条目。
 */
async function ensureCompletionDeclarations(context: vscode.ExtensionContext, mode: CompletionMode, _prompt: boolean): Promise<void> {
    const dir20 = getTypesDir20(context);
    const dir30 = getTypesDir30(context);
    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const inspected = luaConfig.inspect<string[]>(LIBRARY_KEY);

    const updates: Thenable<void>[] = [];

    if (mode === 'off') {
        // 仅从全局作用域移除 MiniWorld 声明
        const globalArr = inspected?.globalValue ?? [];
        const next = globalArr.filter(entry => {
            const n = normalizePath(entry);
            return n !== normalizePath(dir20) && n !== normalizePath(dir30);
        });
        if (!arraysEqual(next, globalArr)) {
            updates.push(luaConfig.update(LIBRARY_KEY, next.length > 0 ? next : undefined, vscode.ConfigurationTarget.Global));
        }
    } else {
        const targetDir = mode === '2.0' ? dir20 : dir30;
        const otherDir = mode === '2.0' ? dir30 : dir20;

        // 仅操作全局作用域：移除冲突版本声明路径，追加目标版本声明路径
        const globalArr = inspected?.globalValue ?? [];
        const next = globalArr.filter(entry => normalizePath(entry) !== normalizePath(otherDir));
        if (!next.some(entry => normalizePath(entry) === normalizePath(targetDir))) {
            next.push(targetDir);
        }
        if (!arraysEqual(next, globalArr)) {
            updates.push(luaConfig.update(LIBRARY_KEY, next, vscode.ConfigurationTarget.Global));
        }
    }

    // 迁移清理：移除工作区作用域中由旧版本插件写入的条目
    const wsArr = getScopeArray(inspected, vscode.ConfigurationTarget.Workspace);
    const wsCleaned = wsArr.filter(entry => {
        const n = normalizePath(entry);
        return n !== normalizePath(dir20) && n !== normalizePath(dir30);
    });
    if (!arraysEqual(wsCleaned, wsArr)) {
        updates.push(luaConfig.update(LIBRARY_KEY, wsCleaned.length > 0 ? wsCleaned : undefined, vscode.ConfigurationTarget.Workspace));
    }

    // 迁移清理：逐文件夹移除工作区文件夹作用域中由旧版本插件写入的条目
    const folders = vscode.workspace.workspaceFolders;
    if (folders) {
        for (const folder of folders) {
            const folderConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION, folder);
            const folderInspected = folderConfig.inspect<string[]>(LIBRARY_KEY);
            const arr = folderInspected?.workspaceFolderValue ?? [];
            const cleaned = arr.filter(entry => {
                const n = normalizePath(entry);
                return n !== normalizePath(dir20) && n !== normalizePath(dir30);
            });
            if (!arraysEqual(cleaned, arr)) {
                updates.push(folderConfig.update(LIBRARY_KEY, cleaned.length > 0 ? cleaned : undefined, vscode.ConfigurationTarget.WorkspaceFolder));
            }
        }
    }

    await Promise.all(updates);
}

/** 打开 Lua 文件时按补全模式自动应用声明（幂等） */
function applyCompletionOnOpen(document: vscode.TextDocument, context: vscode.ExtensionContext): void {
    if (document.languageId !== 'lua') {
        return;
    }
    const mode = getCompletionMode();
    if (mode === 'off') {
        return;
    }
    // 打开文件时静默确保声明
    void ensureCompletionDeclarations(context, mode, false);
}

/**
 * 注册所有声明管理相关的命令和事件监听器。
 *
 * 架构设计：
 * - `miniworld.completion` 是唯一数据源，控制补全版本（2.0 / 3.0 / off）
 * - 用户通过命令或设置修改 `miniworld.completion`，插件自动同步 `Lua.workspace.library`（仅全局作用域）
 * - `.vscode/settings.json` 中仅包含 `miniworld.completion`，不直接暴露 `Lua.workspace.library`
 *
 * @returns 需要添加到 context.subscriptions 的 Disposable 数组
 */
export function registerDeclarationCommands(context: vscode.ExtensionContext): vscode.Disposable[] {
    const disposables: vscode.Disposable[] = [];

    // 迁移旧版本 WorkspaceFolder 作用域的 miniworld.completion 设置到 Workspace 作用域（异步，不阻塞命令注册）
    void migrateWorkspaceFolderSettings();

    // 激活时立即按补全模式应用声明配置
    void ensureCompletionDeclarations(context, getCompletionMode(), true);

    // 补全模式设置变化时自动应用声明配置
    disposables.push(
        vscode.workspace.onDidChangeConfiguration(e => {
            if (e.affectsConfiguration(COMPLETION_MODE_SETTING)) {
                void ensureCompletionDeclarations(context, getCompletionMode(), true);
            }
        })
    );

    // 注册命令：添加 MiniWorld UGC 声明
    // 流程：选择版本 → 选择作用域 → 设置 miniworld.completion → 自动触发 ensureCompletionDeclarations 同步全局 Lua.workspace.library
    disposables.push(
        vscode.commands.registerCommand('miniworld.addDeclarations', async () => {
            const items: (vscode.QuickPickItem & { version: '2.0' | '3.0' })[] = [
                { label: 'UGC 2.0', description: '添加 MiniWorld UGC 2.0 声明', version: '2.0' },
                { label: 'UGC 3.0', description: '添加 MiniWorld UGC 3.0 声明', version: '3.0' },
            ];
            const selected = await vscode.window.showQuickPick(items, {
                placeHolder: '选择要添加的声明版本',
                ignoreFocusOut: true,
            });
            if (!selected) { return; }

            const target = await pickConfigurationTarget(selected.version);
            if (target === undefined) { return; }

            // 作用域优先级冲突检查：当前生效的补全模式来自更高优先级作用域
            const effective = getEffectiveCompletionMode();
            if (effective.mode !== selected.version && effective.mode !== 'off' && effective.scope !== null) {
                if (scopePriority(target) < scopePriority(effective.scope)) {
                    // 目标作用域优先级更低：设置后冲突版本仍会生效，提示用户
                    const proceed = '仍然设置';
                    const action = await vscode.window.showWarningMessage(
                        `当前 ${scopeLabel(effective.scope!)} 已启用 UGC ${effective.mode} 补全（优先级更高），在 ${scopeLabel(target)} 设置 UGC ${selected.version} 不会生效。是否仍然设置？`,
                        proceed,
                        '取消'
                    );
                    if (action !== proceed) { return; }
                }
            }

            // 设置变化会触发 ensureCompletionDeclarations，自动同步全局 Lua.workspace.library
            await vscode.workspace.getConfiguration().update(COMPLETION_MODE_SETTING, selected.version, target);
            vscode.window.showInformationMessage(`MiniWorld UGC ${selected.version} 补全已启用（${scopeLabel(target)}）`);
        })
    );

    // 注册命令：清除补全（选择作用域，清除该作用域的 miniworld.completion 设置）
    disposables.push(
        vscode.commands.registerCommand('miniworld.clearCompletion', async () => {
            const config = vscode.workspace.getConfiguration();
            const inspected = config.inspect<string>(COMPLETION_MODE_SETTING);

            const globalVal = inspected?.globalValue;
            const workspaceVal = inspected?.workspaceValue;
            const globalDesc = globalVal ? `当前: ${globalVal}` : '未设置';
            const workspaceDesc = workspaceVal ? `当前: ${workspaceVal}` : '未设置';

            interface ClearScopeItem extends vscode.QuickPickItem {
                target: vscode.ConfigurationTarget;
            }
            const items: ClearScopeItem[] = [
                { label: '工作区 (Workspace)', description: workspaceDesc, target: vscode.ConfigurationTarget.Workspace },
                { label: '全局 (Global)', description: globalDesc, target: vscode.ConfigurationTarget.Global },
            ];

            const selected = await vscode.window.showQuickPick(items, {
                placeHolder: '选择要清除补全设置的范围',
                ignoreFocusOut: true,
            });
            if (!selected) { return; }

            const scopeVal = selected.target === vscode.ConfigurationTarget.Global ? globalVal : workspaceVal;
            if (!scopeVal) {
                vscode.window.showInformationMessage(`${scopeLabel(selected.target)} 未设置补全，无需清除`);
                return;
            }

            // 清除指定作用域的 miniworld.completion，设置变化会触发 ensureCompletionDeclarations
            await config.update(COMPLETION_MODE_SETTING, undefined, selected.target);
            vscode.window.showInformationMessage(`已清除 ${scopeLabel(selected.target)} 的 MiniWorld UGC 补全设置`);
        })
    );

    // 打开 Lua 文件时按补全模式自动应用声明（幂等）
    disposables.push(
        vscode.workspace.onDidOpenTextDocument(
            (doc) => applyCompletionOnOpen(doc, context)
        )
    );

    return disposables;
}

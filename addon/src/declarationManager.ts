import * as fs from 'fs';
import * as path from 'path';
import * as vscode from 'vscode';

const LUA_CONFIG_SECTION = 'Lua';
const LIBRARY_KEY = 'workspace.library';
const SKIP_PROMPT_KEY = 'skipDeclarationPromptUntil';
const SKIP_FOREVER_KEY = 'skipDeclarationPromptForever';
const SKIP_HOURS = 4;

// 内存中的跳过标记，防止 globalState 异步写入延迟导致重复弹出提示
let skipUntilCached = 0;
let skipForeverCached = false;
/** 标记当前是否已有提示框在显示，防止快速打开多个文件时堆叠 */
let isPromptPending = false;

function getTypesDir20(context: vscode.ExtensionContext): string {
    return context.asAbsolutePath(path.join('addon', 'types', '2.0'));
}

function getTypesDir30(context: vscode.ExtensionContext): string {
    return context.asAbsolutePath(path.join('addon', 'types', '3.0'));
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

function addDeclarations(typesDir: string, version: string = '', target: vscode.ConfigurationTarget = vscode.ConfigurationTarget.Global): Promise<void> {
    if (!fs.existsSync(typesDir)) {
        vscode.window.showErrorMessage(`声明目录不存在: ${typesDir}`);
        return Promise.resolve();
    }

    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const inspected = luaConfig.inspect<string[]>(LIBRARY_KEY);
    const library = luaConfig.get<string[]>(LIBRARY_KEY, []);

    const normalizedTypesDir = normalizePath(typesDir);
    if (library.some(entry => normalizePath(entry) === normalizedTypesDir)) {
        vscode.window.showInformationMessage(`MiniWorld UGC ${version} 声明路径已存在，无需重复添加`);
        return Promise.resolve();
    }

    // 互斥检查：2.0 与 3.0 声明不可共存
    const base = path.dirname(typesDir);
    const otherDir = path.join(base, version === '2.0' ? '3.0' : '2.0');
    const otherVersion = version === '2.0' ? '3.0' : '2.0';
    const normalizedOther = normalizePath(otherDir);

    if (library.some(entry => normalizePath(entry) === normalizedOther)) {
        vscode.window.showErrorMessage(`MiniWorld UGC ${otherVersion} 声明已存在，不可同时添加 ${version} 声明`);
        return Promise.resolve();
    }

    // 仅获取目标作用域的原始值，避免将合并值写入特定作用域
    const targetArray = getScopeArray(inspected, target);

    return Promise.resolve(
        luaConfig.update(LIBRARY_KEY, [...targetArray, typesDir], target)
    )
        .then(() => void vscode.window.showInformationMessage(`MiniWorld UGC ${version} 声明文件添加成功！`))
        .catch((err: Error) => void vscode.window.showErrorMessage(`添加失败: ${err.message}`));
}

/** 从 inspect 结果中提取指定作用域的原始数组 */
function getScopeArray(inspected: { globalValue?: string[]; workspaceValue?: string[]; workspaceFolderValue?: string[] } | undefined, target: vscode.ConfigurationTarget): string[] {
    if (!inspected) {
        return [];
    }
    switch (target) {
        case vscode.ConfigurationTarget.Global:
            return inspected.globalValue ?? [];
        case vscode.ConfigurationTarget.Workspace:
            return inspected.workspaceValue ?? [];
        case vscode.ConfigurationTarget.WorkspaceFolder:
            return inspected.workspaceFolderValue ?? [];
        default:
            return [];
    }
}

function removeDeclarations(typesDir: string, version: string = '', target: vscode.ConfigurationTarget = vscode.ConfigurationTarget.Global): Promise<void> {
    if (!fs.existsSync(typesDir)) {
        vscode.window.showWarningMessage(`声明目录不存在，将尝试清理残留配置: ${typesDir}`);
    }

    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const inspected = luaConfig.inspect<string[]>(LIBRARY_KEY);

    // 仅获取目标作用域的原始值，避免从合并值中移除导致跨作用域误删
    const targetArray = getScopeArray(inspected, target);

    const normalizedTypesDir = normalizePath(typesDir);
    const index = targetArray.findIndex(entry => normalizePath(entry) === normalizedTypesDir);
    if (index === -1) {
        vscode.window.showInformationMessage(`MiniWorld UGC ${version} 声明路径不在该作用域中，无需移除`);
        return Promise.resolve();
    }

    const newLibrary = [...targetArray];
    newLibrary.splice(index, 1);

    return Promise.resolve(
        luaConfig.update(LIBRARY_KEY, newLibrary, target)
    )
        .then(() => void vscode.window.showInformationMessage(`MiniWorld UGC ${version} 声明文件移除成功！`))
        .catch((err: Error) => void vscode.window.showErrorMessage(`移除失败: ${err.message}`));
}

/**
 * 根据操作类型检查各范围是否存在声明路径，仅展示可操作的范围选项。
 * @param typesDir - 目标声明目录
 * @param action - 'add' 仅显示未添加的范围；'remove' 仅显示已添加的范围
 * @returns 用户选择的范围，或 `undefined` 表示取消
 */
async function pickConfigurationTarget(typesDir: string, action: 'add' | 'remove'): Promise<vscode.ConfigurationTarget | undefined> {
    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const inspected = luaConfig.inspect<string[]>(LIBRARY_KEY);
    const normalizedDir = normalizePath(typesDir);

    const hasGlobal = inspected?.globalValue?.some(entry => normalizePath(entry) === normalizedDir) ?? false;
    const hasWorkspace = inspected?.workspaceValue?.some(entry => normalizePath(entry) === normalizedDir) ?? false;
    const hasWorkspaceFolder = inspected?.workspaceFolderValue?.some(entry => normalizePath(entry) === normalizedDir) ?? false;

    interface ScopeItem extends vscode.QuickPickItem {
        target: vscode.ConfigurationTarget;
    }

    const items: ScopeItem[] = [];

    if (action === 'add') {
        if (!hasGlobal) {
            items.push({ label: '全局 (Global)', description: '应用于所有工作区', target: vscode.ConfigurationTarget.Global });
        }
        if (!hasWorkspace) {
            items.push({ label: '工作区 (Workspace)', description: '保存到 .vscode/settings.json', target: vscode.ConfigurationTarget.Workspace });
        }
        if (!hasWorkspaceFolder) {
            items.push({ label: '工作区文件夹 (WorkspaceFolder)', description: '保存到工作区文件夹设置', target: vscode.ConfigurationTarget.WorkspaceFolder });
        }
    } else {
        if (hasGlobal) {
            items.push({ label: '全局 (Global)', description: '应用于所有工作区', target: vscode.ConfigurationTarget.Global });
        }
        if (hasWorkspace) {
            items.push({ label: '工作区 (Workspace)', description: '保存到 .vscode/settings.json', target: vscode.ConfigurationTarget.Workspace });
        }
        if (hasWorkspaceFolder) {
            items.push({ label: '工作区文件夹 (WorkspaceFolder)', description: '保存到工作区文件夹设置', target: vscode.ConfigurationTarget.WorkspaceFolder });
        }
    }

    if (items.length === 0) {
        if (action === 'add') {
            vscode.window.showInformationMessage('所有范围内均已添加该声明路径，无需重复添加');
        } else {
            vscode.window.showInformationMessage('未在任何范围内找到该声明路径，无需移除');
        }
        return undefined;
    }

    const placeHolder = action === 'add' ? '选择添加声明路径的范围' : '选择移除声明路径的范围';

    const selected = await vscode.window.showQuickPick(items, {
        placeHolder,
        ignoreFocusOut: true,
    });

    return selected?.target;
}

function checkDeclarationsOnOpen(document: vscode.TextDocument, context: vscode.ExtensionContext): void {
    if (document.languageId !== 'lua') {
        return;
    }

    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const library = luaConfig.get<string[]>(LIBRARY_KEY, []);

    const dir20 = getTypesDir20(context);
    const dir30 = getTypesDir30(context);

    const normalizedDir20 = normalizePath(dir20);
    const normalizedDir30 = normalizePath(dir30);
    const has20 = library.some(entry => normalizePath(entry) === normalizedDir20);
    const has30 = library.some(entry => normalizePath(entry) === normalizedDir30);

    // 如果某个声明已存在，其冲突版本不可添加，无需提示
    if (has20 || has30) {
        return;
    }

    // 检查是否已选择永不提醒，或在暂不添加的冷却期内
    // 优先检查内存缓存（同步），再回退到 globalState（可能因异步写入延迟而滞后）
    if (skipForeverCached || context.globalState.get<boolean>(SKIP_FOREVER_KEY, false)) {
        return;
    }
    const skipUntil = skipUntilCached > 0 ? skipUntilCached : context.globalState.get<number>(SKIP_PROMPT_KEY, 0);
    if (Date.now() < skipUntil) {
        return;
    }

    // 已有提示框在显示时不再重复弹出
    if (isPromptPending) {
        return;
    }

    const options: (vscode.QuickPickItem & { action: string })[] = [
        { label: '不添加声明', description: '4 小时内不再提示', action: 'none' },
        { label: '永不提醒', description: '不再显示此提示', action: 'never' },
        { label: '添加 2.0 声明', description: `添加 ${dir20}`, action: '20' },
        { label: '添加 3.0 声明', description: `添加 ${dir30}`, action: '30' },
    ];

    isPromptPending = true;
    vscode.window.showQuickPick(options, {
        placeHolder: '检测到未添加 MiniWorld UGC 声明，是否添加？',
        ignoreFocusOut: true,
    }).then(async (selected) => {
        isPromptPending = false;
        if (!selected) {
            return;
        }

        if (selected.action === 'none') {
            // 4 小时内不再提示（先更新内存缓存，再异步写入持久化）
            skipUntilCached = Date.now() + SKIP_HOURS * 60 * 60 * 1000;
            await context.globalState.update(SKIP_PROMPT_KEY, skipUntilCached);
        } else if (selected.action === 'never') {
            skipForeverCached = true;
            await context.globalState.update(SKIP_FOREVER_KEY, true);
        } else if (selected.action === '20') {
            addDeclarations(dir20, '2.0');
        } else if (selected.action === '30') {
            addDeclarations(dir30, '3.0');
        }
    });
}

/**
 * 注册所有声明管理相关的命令和事件监听器。
 * @returns 需要添加到 context.subscriptions 的 Disposable 数组
 */
export function registerDeclarationCommands(context: vscode.ExtensionContext): vscode.Disposable[] {
    const disposables: vscode.Disposable[] = [];

    // 注册命令：添加/移除 2.0 声明
    disposables.push(
        vscode.commands.registerCommand('complete.addDeclarations20', async () => {
            const typesDir = getTypesDir20(context);
            const target = await pickConfigurationTarget(typesDir, 'add');
            if (target === undefined) { return; }
            await addDeclarations(typesDir, '2.0', target);
        })
    );

    disposables.push(
        vscode.commands.registerCommand('complete.removeDeclarations20', async () => {
            const typesDir = getTypesDir20(context);
            const target = await pickConfigurationTarget(typesDir, 'remove');
            if (target === undefined) { return; }
            await removeDeclarations(typesDir, '2.0', target);
        })
    );

    // 注册命令：添加/移除 3.0 声明
    disposables.push(
        vscode.commands.registerCommand('complete.addDeclarations30', async () => {
            const typesDir = getTypesDir30(context);
            const target = await pickConfigurationTarget(typesDir, 'add');
            if (target === undefined) { return; }
            await addDeclarations(typesDir, '3.0', target);
        })
    );

    disposables.push(
        vscode.commands.registerCommand('complete.removeDeclarations30', async () => {
            const typesDir = getTypesDir30(context);
            const target = await pickConfigurationTarget(typesDir, 'remove');
            if (target === undefined) { return; }
            await removeDeclarations(typesDir, '3.0', target);
        })
    );

    // 注册命令：重置声明提示（清除"永不提醒"和冷却期）
    disposables.push(
        vscode.commands.registerCommand('complete.resetDeclarationPrompt', async () => {
            skipForeverCached = false;
            skipUntilCached = 0;
            await context.globalState.update(SKIP_FOREVER_KEY, undefined);
            await context.globalState.update(SKIP_PROMPT_KEY, undefined);
            vscode.window.showInformationMessage('声明提示已重置，下次打开 Lua 文件时将重新询问');
        })
    );

    // 打开 Lua 文件时检查声明状态并提示添加
    disposables.push(
        vscode.workspace.onDidOpenTextDocument(
            (doc) => checkDeclarationsOnOpen(doc, context)
        )
    );

    return disposables;
}

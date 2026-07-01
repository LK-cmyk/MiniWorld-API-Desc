import * as vscode from 'vscode';
import * as fs from 'fs';

const LUA_CONFIG_SECTION = 'Lua';
const LIBRARY_KEY = 'workspace.library';

function getTypesDir(context: vscode.ExtensionContext): string {
    return context.asAbsolutePath('addon/types');
}

function addDeclarations(context: vscode.ExtensionContext): void {
    const typesDir = getTypesDir(context);

    if (!fs.existsSync(typesDir)) {
        vscode.window.showErrorMessage(`声明目录不存在: ${typesDir}`);
        return;
    }

    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const library = luaConfig.get<string[]>(LIBRARY_KEY, []);

    if (library.includes(typesDir)) {
        vscode.window.showInformationMessage('声明路径已存在，无需重复添加');
        return;
    }

    Promise.resolve(
        luaConfig.update(LIBRARY_KEY, [...library, typesDir], vscode.ConfigurationTarget.Global)
    )
        .then(() => vscode.window.showInformationMessage('Lua 声明文件添加成功！'))
        .catch((err: Error) => vscode.window.showErrorMessage(`添加失败: ${err.message}`));
}

function removeDeclarations(context: vscode.ExtensionContext): void {
    const typesDir = getTypesDir(context);

    if (!fs.existsSync(typesDir)) {
        vscode.window.showErrorMessage(`声明目录不存在: ${typesDir}`);
        return;
    }

    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const library = luaConfig.get<string[]>(LIBRARY_KEY, []);

    const index = library.indexOf(typesDir);
    if (index === -1) {
        vscode.window.showInformationMessage('声明路径不在列表中，无需移除');
        return;
    }

    const newLibrary = [...library];
    newLibrary.splice(index, 1);

    Promise.resolve(
        luaConfig.update(LIBRARY_KEY, newLibrary, vscode.ConfigurationTarget.Global)
    )
        .then(() => vscode.window.showInformationMessage('Lua 声明文件移除成功！'))
        .catch((err: Error) => vscode.window.showErrorMessage(`移除失败: ${err.message}`));
}

export function activate(context: vscode.ExtensionContext) {
    console.log('MiniWorld API Desc 完成插件已激活');

    // 注册命令：添加声明路径
    const addDisposable = vscode.commands.registerCommand('complete.addDeclarations', () => {
        addDeclarations(context);
    });

    // 注册命令：移除声明路径
    const removeDisposable = vscode.commands.registerCommand('complete.removeDeclarations', () => {
        removeDeclarations(context);
    });

    context.subscriptions.push(addDisposable, removeDisposable);

    // 激活时自动注入声明路径
    addDeclarations(context);
}

export function deactivate() {}
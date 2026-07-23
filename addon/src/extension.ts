import * as vscode from 'vscode';

import { ApiSearchProvider } from './apiSearch';
import { registerDeclarationCommands } from './declarationManager';
import { registerEventCompletion } from './eventCompletion';

export function activate(context: vscode.ExtensionContext) {
    console.log('MiniWorld API Desc 完成插件已激活');

    // 声明管理（注册 2.0/3.0 声明命令 + 打开文件提示）
    context.subscriptions.push(...registerDeclarationCommands(context));

    // 事件补全（异步加载事件定义 + 补全提供者 + 长括号包裹命令）
    context.subscriptions.push(...registerEventCompletion(context));

    // API 搜索
    const apiSearchProvider = new ApiSearchProvider(context.extensionUri, context);
    context.subscriptions.push(
        vscode.window.registerWebviewViewProvider(
            ApiSearchProvider.viewType,
            apiSearchProvider,
        ),
        vscode.commands.registerCommand('miniworld.apiSearch.focus', () => {
            vscode.commands.executeCommand('workbench.view.extension.miniworld-api-search');
        }),
        vscode.commands.registerCommand('miniworld.apiSearch.refresh', async () => {
            await apiSearchProvider.refresh();
        }),
    );
}

export function deactivate() {}
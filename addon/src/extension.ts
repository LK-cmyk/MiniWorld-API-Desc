import * as vscode from 'vscode';

import { ApiSearchProvider } from './apiSearch';
import { registerDeclarationCommands } from './declarationManager';
import { registerEventCompletion } from './eventCompletion';
import { registerScriptTable } from './scriptTable';

const OUTPUT_CHANNEL_NAME = 'MiniWorld API Desc';

export function activate(context: vscode.ExtensionContext): void {
    const log = vscode.window.createOutputChannel(OUTPUT_CHANNEL_NAME);
    context.subscriptions.push(log);
    log.appendLine('MiniWorld API Desc 完成插件已激活');

    registerModule(context, log, '声明管理', () => registerDeclarationCommands(context));
    registerModule(context, log, '事件补全', () => registerEventCompletion(context));
    registerModule(context, log, '脚本表组件方法', () => registerScriptTable(context));
    registerApiSearch(context, log);
}

/**
 * 单个模块初始化失败只记录日志并提示
 * 不会中断后续模块的注册
 */
function registerModule(
    context: vscode.ExtensionContext,
    log: vscode.OutputChannel,
    name: string,
    register: () => vscode.Disposable[],
): void {
    try {
        context.subscriptions.push(...register());
    } catch (error) {
        log.appendLine(`[${name}] 注册失败: ${String(error)}`);
        void vscode.window.showErrorMessage(`MiniWorld API：${name}初始化失败，请查看输出面板`);
    }
}

/** 注册 API 搜索视图及其相关命令 */
function registerApiSearch(context: vscode.ExtensionContext, log: vscode.OutputChannel): void {
    const provider = new ApiSearchProvider(context.extensionUri, context);

    // 统一包裹命令执行，避免未捕获的 rejection 让扩展静默失效
    const runCommand = async (label: string, fn: () => Promise<void>): Promise<void> => {
        try {
            await fn();
        } catch (error) {
            log.appendLine(`[${label}] 失败: ${String(error)}`);
            void vscode.window.showErrorMessage(`MiniWorld API：${label}失败`);
        }
    };

    context.subscriptions.push(
        vscode.window.registerWebviewViewProvider(ApiSearchProvider.viewType, provider),
        vscode.commands.registerCommand('miniworld.apiSearch.focus', () => {
            void vscode.commands.executeCommand('workbench.view.extension.miniworld-api-search');
        }),
        vscode.commands.registerCommand('miniworld.apiSearch.refresh', () =>
            runCommand('刷新 API 数据', () => provider.refresh()),
        ),
        vscode.commands.registerCommand('miniworld.apiSearch.clearCache', () =>
            runCommand('清空 ID 缓存', async () => {
                const ok = await provider.clearIdCache();
                if (ok) {
                    void vscode.window.showInformationMessage('MiniWorld API：ID 数据缓存已清空并重新下载');
                } else {
                    void vscode.window.showWarningMessage('MiniWorld API：缓存已清空，但重新下载失败（请检查服务器地址设置）');
                }
            }),
        ),
    );
}

export function deactivate(): void {
    // 所有资源均已通过 context.subscriptions 自动释放
}
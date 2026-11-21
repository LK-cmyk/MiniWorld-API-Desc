import * as vscode from 'vscode';

/**
 * 补全模式设置项 key，控制声明补全 + 事件补全：
 * - '2.0'：UGC 2.0（默认）
 * - '3.0'：UGC 3.0
 * - 'off'：关闭补全
 */
export const COMPLETION_MODE_SETTING = 'miniworld.completion';

/** 补全模式：2.0 / 3.0 / 关闭 */
export type CompletionMode = '2.0' | '3.0' | 'off';

/** 生效模式及其来源作用域（唯一权威判定） */
export interface EffectiveCompletionMode {
    mode: CompletionMode;
    scope: vscode.ConfigurationTarget | null;
}

/** 读取配置时使用的作用域，从高到低（含 WorkspaceFolder 以兼容旧版本设置） */
export const COMPLETION_MODE_SCOPES: vscode.ConfigurationTarget[] = [
    vscode.ConfigurationTarget.WorkspaceFolder,
    vscode.ConfigurationTarget.Workspace,
    vscode.ConfigurationTarget.Global,
];

type ModeInspection = {
    globalValue?: string;
    workspaceValue?: string;
    workspaceFolderValue?: string;
};

/** 从 inspect 结果中提取指定作用域的原始值（泛型，数组/字符串共用） */
export function getScopeValue<T>(inspected: ModeInspection | { globalValue?: string[]; workspaceValue?: string[]; workspaceFolderValue?: string[] } | undefined, target: vscode.ConfigurationTarget): T | undefined {
    if (!inspected) {
        return undefined;
    }
    switch (target) {
        case vscode.ConfigurationTarget.Global:
            return (inspected as { globalValue?: T }).globalValue;
        case vscode.ConfigurationTarget.Workspace:
            return (inspected as { workspaceValue?: T }).workspaceValue;
        case vscode.ConfigurationTarget.WorkspaceFolder:
            return (inspected as { workspaceFolderValue?: T }).workspaceFolderValue;
        default:
            return undefined;
    }
}

function isCompletionMode(value: unknown): value is CompletionMode {
    return value === '2.0' || value === '3.0' || value === 'off';
}

/**
 * 唯一的补全模式判定：按作用域优先级取第一个合法值，全部非法时回退 '2.0'。
 * 声明管理、事件补全、脚本表均调用本函数，避免多套判定在非法配置下错配。
 */
export function getEffectiveCompletionMode(): EffectiveCompletionMode {
    const inspected = vscode.workspace.getConfiguration().inspect<string>(COMPLETION_MODE_SETTING);
    for (const scope of COMPLETION_MODE_SCOPES) {
        const raw = getScopeValue<string>(inspected, scope);
        if (isCompletionMode(raw)) {
            return { mode: raw, scope };
        }
    }
    return { mode: '2.0', scope: null };
}

/** 读取补全模式设置；非法值回退到 '2.0' */
export function getCompletionMode(): CompletionMode {
    return getEffectiveCompletionMode().mode;
}

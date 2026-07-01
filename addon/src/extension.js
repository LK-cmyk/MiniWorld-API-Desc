"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = __importStar(require("vscode"));
const fs = __importStar(require("fs"));
const LUA_CONFIG_SECTION = 'Lua';
const LIBRARY_KEY = 'workspace.library';
function getTypesDir(context) {
    return context.asAbsolutePath('addon/types');
}
function addDeclarations(context) {
    const typesDir = getTypesDir(context);
    if (!fs.existsSync(typesDir)) {
        vscode.window.showErrorMessage(`声明目录不存在: ${typesDir}`);
        return;
    }
    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const library = luaConfig.get(LIBRARY_KEY, []);
    if (library.includes(typesDir)) {
        vscode.window.showInformationMessage('声明路径已存在，无需重复添加');
        return;
    }
    Promise.resolve(luaConfig.update(LIBRARY_KEY, [...library, typesDir], vscode.ConfigurationTarget.Global))
        .then(() => vscode.window.showInformationMessage('Lua 声明文件添加成功！'))
        .catch((err) => vscode.window.showErrorMessage(`添加失败: ${err.message}`));
}
function removeDeclarations(context) {
    const typesDir = getTypesDir(context);
    if (!fs.existsSync(typesDir)) {
        vscode.window.showErrorMessage(`声明目录不存在: ${typesDir}`);
        return;
    }
    const luaConfig = vscode.workspace.getConfiguration(LUA_CONFIG_SECTION);
    const library = luaConfig.get(LIBRARY_KEY, []);
    const index = library.indexOf(typesDir);
    if (index === -1) {
        vscode.window.showInformationMessage('声明路径不在列表中，无需移除');
        return;
    }
    const newLibrary = [...library];
    newLibrary.splice(index, 1);
    Promise.resolve(luaConfig.update(LIBRARY_KEY, newLibrary, vscode.ConfigurationTarget.Global))
        .then(() => vscode.window.showInformationMessage('Lua 声明文件移除成功！'))
        .catch((err) => vscode.window.showErrorMessage(`移除失败: ${err.message}`));
}
function activate(context) {
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
function deactivate() { }
//# sourceMappingURL=extension.js.map
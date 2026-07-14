# MiniWorld-API-Desc

![GitHub stars](https://img.shields.io/github/stars/LK-cmyk/MiniWorld-API-Desc?style=flat)
![GitHub forks](https://img.shields.io/github/forks/LK-cmyk/MiniWorld-API-Desc?style=flat)
![License](https://img.shields.io/github/license/LK-cmyk/MiniWorld-API-Desc)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.125.0-blue)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-yellow)

[![English Version README](https://img.shields.io/badge/English-README-blue?logo=markdown)](./README.en.md)

《迷你世界》UGC Lua 开发的 API 声明库、代码补全插件与辅助工具集。

> **不再推荐使用声明文件来进行声明，推荐使用声明插件。**  
> 安装本扩展后，通过 `Ctrl+Shift+P` 执行相应命令即可自动配置声明路径，无需手动操作。

提供完整的 Lua 类型声明文件，配合 VS Code 的 [Lua 语言服务（sumneko.lua）](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) 获得智能补全、类型提示和参数文档；同时提供事件补全插件、代码片段模板和 API 对比脚本，提升 UGC 组件开发效率。

## 快速开始

### 前置依赖

- [VS Code](https://code.visualstudio.com/)
- [Lua 语言服务插件（sumneko.lua）](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- Python 3.10+（仅使用工具脚本时需要）
- Node.js（仅自行构建扩展时需要）

### 安装扩展

从 [GitHub Releases](https://github.com/LK-cmyk/MiniWorld-API-Desc/releases) 下载 `.vsix` 文件，然后在 VS Code 中：

1. 打开扩展面板（`Ctrl+Shift+X`）
2. 点击右上角 `···` → `Install from VSIX...` (`从 VSIX 安装...`)
3. 选择下载的 `.vsix` 文件

安装后按下 `Ctrl+Shift+P`，执行 **MiniWorld API Description: 添加 MiniWorld UGC 3.0 声明** 或 **MiniWorld API Description: 添加 MiniWorld UGC 2.0 声明** 命令即可启用类型提示。

### 首次使用流程

打开任意 `.lua` 文件时，插件会自动检测声明路径是否已配置。若未配置，弹出提示窗口：

| 选项 | 行为 |
| :-: | :-: |
| **不添加声明** | 4 小时内不再提示 |
| **永不提醒** | 永久不再提示 |
| **添加 2.0 / 3.0 声明** | 弹出范围选择，将声明路径写入指定作用域 |

2.0 与 3.0 声明为互斥关系，不可同时共存。

## 插件命令

按下 `Ctrl+Shift+P` 打开命令面板，输入关键词 `MiniWorld` 即可找到以下命令：

| 命令 | 说明 |
| :-: | :-: |
| `MiniWorld API Description: 添加 MiniWorld UGC 2.0 声明` | 将 2.0 声明目录添加到 `Lua.workspace.library` |
| `MiniWorld API Description: 移除 MiniWorld UGC 2.0 声明` | 从配置中移除 2.0 声明目录 |
| `MiniWorld API Description: 添加 MiniWorld UGC 3.0 声明` | 将 3.0 声明目录添加到 `Lua.workspace.library` |
| `MiniWorld API Description: 移除 MiniWorld UGC 3.0 声明` | 从配置中移除 3.0 声明目录 |
| `MiniWorld API Description: 打开 API 搜索` | 打开 API 搜索面板，快速检索函数、枚举、事件 |
| `MiniWorld API Description: 刷新 API 搜索索引` | 重新扫描声明文件，更新搜索索引 |

执行添加/移除命令时，会弹出范围选择窗口：

| 范围 | 说明 |
| :-: | :-: |
| **全局 (Global)** | 写入用户设置，所有工作区生效 |
| **工作区 (Workspace)** | 写入 `.vscode/settings.json`，仅当前工作区生效 |
| **工作区文件夹 (WorkspaceFolder)** | 写入工作区文件夹设置 |

插件会根据当前各范围的配置状态自动筛选可用选项：添加时仅显示**未包含**该声明的范围，移除时仅显示**已包含**该声明的范围。

## API 搜索

v0.6.1 新增了 **API 搜索面板**，支持在 VS Code 侧边栏中快速检索所有 MiniWorld API，无需跳出编辑器翻阅文档。

### 打开方式

| 方式 | 操作 |
| :-: | :-: |
| **命令面板** | `Ctrl+Shift+P` → 输入 **MiniWorld API Description: 打开 API 搜索** |
| **侧边栏按钮** | 点击左侧活动栏的 🔍 **MiniWorld API 搜索** 图标 |

### 功能介绍

- **模糊搜索** — 输入关键词即可按名称、参数、描述进行模糊匹配，支持首字母缩写（如输入 `GP` 匹配 `GetPosition`）
- **筛选过滤** — 支持按版本（2.0 / 3.0）、模块、类型（函数 / 枚举 / 事件）进行筛选
- **详情查看** — 点击搜索结果可查看完整的参数列表、返回值、枚举值和事件参数
- **点击跳转** — 点击结果条目即可跳转到声明文件对应的源码位置
- **刷新索引** — 执行 **MiniWorld API Description: 刷新 API 搜索索引** 命令可重新扫描声明文件

### 快捷键

在搜索输入框中按 `Ctrl+K` 可快速清空搜索内容。

## 项目结构

```bash
MiniWorld-API-Desc/
├── package.json                 # VS Code 扩展清单
├── tsconfig.json                # TypeScript 编译配置
├── eslint.config.mjs            # ESLint 配置
├── pack.ps1                     # 编译打包脚本
├── .vscodeignore                # 扩展发布忽略规则
├── addon/                       # VS Code 扩展源码
│   ├── src/
│   │   └── extension.ts         # 插件主逻辑
│   └── types/                   # 声明文件
├── multiple/                    # 按模块拆分的声明文件
│   ├── 2.0/                     # 28 个模块文件
│   └── 3.0/                     # 25 个模块文件
├── AiDesc/                      # AI 辅助描述文件
│   └── 3.0/
│       ├── AiDesc.md            # UGC 3.0 开发指南（面向 AI）
│       └── MNAiDesc.txt         # API 纯文本描述
├── tools/                       # Python 工具脚本
│   ├── 2.0/                     # 2.0 工具集
│   │   ├── Merge.py
│   │   ├── FuncCompare.py
│   │   ├── EventCompare.py
│   │   └── DescToAiDesc.py
│   └── 3.0/                     # 3.0 工具集
│       ├── Merge.py
│       ├── FuncCompare.py
│       ├── EventCompare.py
│       ├── EnumLibCompare.py
│       └── DescToAiDesc.py
└── img/
    └── Logo-128px.png           # 插件图标
```

## 工具脚本

在仓库根目录运行以下命令（需 Python 3.10+，依赖见 `pyproject.toml`）：

```bash
# 声明合并
python tools/3.0/Merge.py              # 合并 multiple/3.0/ 为 merged.3.0.lua
python tools/2.0/Merge.py              # 合并 multiple/2.0/ 为 merged.2.0.lua

# API 对比（对比本地声明与官方在线文档）
python tools/3.0/FuncCompare.py        # 3.0 函数对比
python tools/3.0/EventCompare.py       # 3.0 事件对比
python tools/3.0/EnumLibCompare.py     # 3.0 枚举对比
python tools/2.0/FuncCompare.py        # 2.0 函数对比
python tools/2.0/EventCompare.py       # 2.0 事件对比

# AI 描述生成
python tools/3.0/DescToAiDesc.py       # 生成 AiDesc/3.0/MNAiDesc.txt
python tools/2.0/DescToAiDesc.py       # 生成 AiDesc/2.0/MNAiDesc.txt
```

## AI 使用建议

将以下文件内容提供给 AI 助手，可帮助其理解 UGC 3.0 API：

- **[AiDesc/3.0/AiDesc.md](./AiDesc/3.0/AiDesc.md)** — UGC 3.0 开发指南，包含脚本规范、事件用法、坐标系、天空盒等开发要点
- **[AiDesc/3.0/MNAiDesc.txt](./AiDesc/3.0/MNAiDesc.txt)** — 纯文本格式的 API 描述，不含类型注解标记，适合对标记敏感的场景

## 自行构建

需要 Node.js 环境。在项目根目录执行：

```powershell
./pack.ps1 # 完整打包
./pack.ps1 -CompileOnly # 仅编译，不打包
./pack.ps1 -SkipLint # 跳过 lint 检查
./pack.ps1 -SkipInstall # 跳过 npm install
./pack.ps1 -Clean # 仅清除编译输出
```

打包完成后会在根目录生成 `.vsix` 文件，可直接安装到 VS Code。

## 适用范围

| 项目 | 版本 |
| :-: | :-: |
| 《迷你世界》游戏 | v1.56+ |
| UGC 开发套件 | 3.0 & 2.0 |
| Python | 3.10+ |
| VS Code | ^1.125.0 |

## 注意事项

- 本仓库声明文件，与扩展仅面向 **UGC 3.0** & **UGC 2.0**，请勿用于其他版本
- 部分接口可能与实际游戏版本存在差异，请以游戏实际行为为准
- 如发现问题或需要补充 API，欢迎提交 [Issue](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) 或发起 Pull Request

## Star History

<a href="https://www.star-history.com/?repos=LK-cmyk%2FMiniWorld-API-Desc&type=date&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/chart?repos=LK-cmyk/MiniWorld-API-Desc&type=date&theme=dark&legend=top-left&sealed_token=-iH9xbwxhzvpzCuOrPjrIwCmi2uemPhf6biWoG4UA0NHHpY6fr_QqM0L8lxPzS4J_APdisJuSPEp8q0qqGDLhu98FUcXLJg9Mvz5cXHlojjYk-AtgrEGl8PXhLtOHe0mW_GUEVo4_0fkDGZX2EQxicPo88CSSP9bysVqe6NNlFwmZR_QVx2XtlzUUOgn" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/chart?repos=LK-cmyk/MiniWorld-API-Desc&type=date&legend=top-left&sealed_token=-iH9xbwxhzvpzCuOrPjrIwCmi2uemPhf6biWoG4UA0NHHpY6fr_QqM0L8lxPzS4J_APdisJuSPEp8q0qqGDLhu98FUcXLJg9Mvz5cXHlojjYk-AtgrEGl8PXhLtOHe0mW_GUEVo4_0fkDGZX2EQxicPo88CSSP9bysVqe6NNlFwmZR_QVx2XtlzUUOgn" />
   <img alt="Star History Chart" src="https://api.star-history.com/chart?repos=LK-cmyk/MiniWorld-API-Desc&type=date&legend=top-left&sealed_token=-iH9xbwxhzvpzCuOrPjrIwCmi2uemPhf6biWoG4UA0NHHpY6fr_QqM0L8lxPzS4J_APdisJuSPEp8q0qqGDLhu98FUcXLJg9Mvz5cXHlojjYk-AtgrEGl8PXhLtOHe0mW_GUEVo4_0fkDGZX2EQxicPo88CSSP9bysVqe6NNlFwmZR_QVx2XtlzUUOgn" />
 </picture>
</a>

## 许可

[MIT](./LICENSE)

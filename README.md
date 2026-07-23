# MiniWorld-API-Desc

![GitHub stars](https://img.shields.io/github/stars/LK-cmyk/MiniWorld-API-Desc?style=flat)
![GitHub forks](https://img.shields.io/github/forks/LK-cmyk/MiniWorld-API-Desc?style=flat)
![License](https://img.shields.io/github/license/LK-cmyk/MiniWorld-API-Desc)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.125.0-blue)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-yellow)
<br>

![UGC 3.0](https://img.shields.io/badge/UGC-3.0-blue)
![UGC 2.0](https://img.shields.io/badge/UGC-2.0-blue)

[![English Version README](https://img.shields.io/badge/English-README-blue?logo=markdown)](./README.en.md)

《迷你世界》UGC Lua 开发的 API 声明库、代码补全插件与辅助工具集。

> **不再推荐使用声明文件来进行声明，推荐使用声明插件。**  
> 安装本扩展后，通过 `Ctrl+Shift+P` 执行相应命令即可自动配置声明路径，无需手动操作。

📚 **目录**

- [快速开始](#快速开始)
- [API 搜索](#api-搜索)
- [插件命令](#插件命令)
- [项目结构](#项目结构)
- [工具脚本](#工具脚本)
- [AI 使用建议](#ai-使用建议)
- [自行构建](#自行构建)
- [适用范围](#适用范围)
- [贡献指南](#贡献指南)
- [注意事项](#注意事项)
- [许可协议](#许可协议)

---

提供完整的 Lua 类型声明文件，配合 VS Code 的 [Lua 语言服务（sumneko.lua）](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) 获得智能补全、类型提示和参数文档；同时提供事件补全插件、代码片段模板和 API 对比脚本，提升 UGC 组件开发效率。

## 快速开始

### 前置依赖

| 依赖 | 必选 | 说明 |
| :-- | :-: | :-: |
| [VS Code](https://code.visualstudio.com/) | 是 | 提供代码补全、类型提示等功能 |
| [Lua 语言服务插件（sumneko.lua）](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) | 是 | 提供 Lua 语言服务，需安装插件 |
| Python 3.10+ | 否 | 仅使用工具脚本时需要 |
| Node.js | 否 | 仅自行构建扩展时需要 |
| PowerShell 5.1+ | 否 | 仅自行构建扩展时需要 |

### 安装扩展

1. 从 [GitHub Releases](https://github.com/LK-cmyk/MiniWorld-API-Desc/releases) 下载 `.vsix` 文件
2. 打开扩展面板（`Ctrl+Shift+X`）
3. 点击右上角 `···` → `从 VSIX 安装...`
4. 选择下载的 `.vsix` 文件

安装后按下 `Ctrl+Shift+P`，执行以下任一命令即可启用类型提示

- `MiniWorld API Description: 添加 MiniWorld UGC 3.0 声明`
- `MiniWorld API Description: 添加 MiniWorld UGC 2.0 声明`

> 💡 2.0 与 3.0 声明为互斥关系，不可同时共存

### 首次使用流程

打开任意 `.lua` 文件时，插件会自动检测声明路径是否已配置。若未配置，弹出提示窗口：

| 选项 | 行为 |
| :-: | :-: |
| **不添加声明** | 4 小时内不再提示 |
| **永不提醒** | 永久不再提示 |
| **添加 2.0 / 3.0 声明** | 弹出范围选择，将声明路径写入指定作用域 |

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

### 作用域

- 执行添加 / 移除命令时，可选择配置写入的作用域

  | 范围 | 说明 |
  | :-: | :-: |
  | **全局 (Global)** | 写入用户设置，所有工作区生效 |
  | **工作区 (Workspace)** | 写入 `.vscode/settings.json`，仅当前工作区生效 |
  | **工作区文件夹 (WorkspaceFolder)** | 写入工作区文件夹设置 |

插件会根据当前各范围的配置状态自动筛选可用选项：添加时仅显示**未包含**该声明的范围，移除时仅显示**已包含**该声明的范围

### 使用示例

```lua
-- 使用类型提示的示例
local actor = MNActor.create("testActor")
local pos = actor:GetPosition()  -- 智能补全和类型提示
actor:SetPosition(pos.x + 1, pos.y, pos.z)
```

```lua
-- 使用事件系统
local function onPlayerJoin(player)
    print("玩家加入: " .. player.name)
end

MNGame.addEventListener("onPlayerJoin", onPlayerJoin)
```

## API 搜索

v0.6.1 新增了 **API 搜索面板**，支持在 VS Code 侧边栏中快速检索所有 MiniWorld API，无需跳出编辑器翻阅文档

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
├── package.json  # VS Code 扩展清单
├── tsconfig.json  # TypeScript 编译配置
├── eslint.config.mjs  # ESLint 配置
├── pack.ps1  # 编译打包脚本
├── .vscodeignore  # 扩展发布忽略规则
├── addon/  # VS Code 扩展源码
├── multiple/  # 按模块拆分的声明文件
├── docs/  # 项目文档
├── tools/  # Python 工具脚本
└── img/  # 图片资源
```

## 工具脚本

在仓库根目录运行以下命令（需 Python 3.12+，依赖见 `pyproject.toml`）：

### 声明管理

| 类别 | 命令 | 说明 |
| :-: | :-- | :-: |
| 声明合并 | `python tools/3.0/Merge.py` | 合并 multiple/3.0/ 为 merged.3.0.lua |
| 声明合并 | `python tools/2.0/Merge.py` | 合并 multiple/2.0/ 为 merged.2.0.lua |

### API 对比

| 类别 | 命令 | 说明 |
| :-: | :-- | :-: |
| 3.0 函数对比 | `python tools/3.0/FuncCompare.py` | 对比 3.0 版本函数差异 |
| 3.0 事件对比 | `python tools/3.0/EventCompare.py` | 对比 3.0 版本事件差异 |
| 3.0 枚举对比 | `python tools/3.0/EnumLibCompare.py` | 对比 3.0 版本枚举差异 |
| 2.0 函数对比 | `python tools/2.0/FuncCompare.py` | 对比 2.0 版本函数差异 |
| 2.0 事件对比 | `python tools/2.0/EventCompare.py` | 对比 2.0 版本事件差异 |

### AI 工具

| 类别 | 命令 | 说明 |
| :-: | :-- | :-: |
| AI 描述生成 | `python tools/3.0/DescToAiDesc.py` | 生成 AiDesc/3.0/MNAiDesc.txt |
| AI 描述生成 | `python tools/2.0/DescToAiDesc.py` | 生成 AiDesc/2.0/MNAiDesc.txt |

## AI 使用建议

将以下文件内容提供给 AI 助手，可帮助其理解 UGC：

- UGC 3.0
  - [SKILL.md](./docs/miniworld-ugc-30/SKILL.md)
  - [API.txt](./docs/miniworld-ugc-30/references/API.txt)
- UGC 2.0
  - [API.txt](./docs/miniworld-ugc-20/references/API.txt)

## 自行构建

需要 Node.js 环境。在项目根目录执行：

### 构建选项

| 命令 | 说明 |
| :-- | :-: |
| `./pack.ps1` | 完整打包（编译 + 检查 + 打包） |
| `./pack.ps1 -CompileOnly` | 仅编译，不打包 |
| `./pack.ps1 -SkipLint` | 跳过 lint 检查 |
| `./pack.ps1 -SkipInstall` | 跳过 npm install |
| `./pack.ps1 -Clean` | 仅清除编译输出 |

### 构建流程

```bash
npm install # 1. 安装依赖
tsc # 2. 编译 TypeScript
./pack.ps1 # 3. 打包扩展
code --install-extension MiniWorld-API-Desc.vsix # 4. 安装扩展（可选）
```

打包完成后会在根目录生成 `.vsix` 文件，可直接安装到 VS Code。

## 适用范围

| 项目 | 版本 |
| :-- | :-: |
| 《迷你世界》游戏 | v1.56+ |
| UGC 开发套件 | 3.0 & 2.0 |
| Python | 3.10+ |
| VS Code | ^1.125.0 |

### 系统要求

- **操作系统**: Windows, macOS, Linux
- **内存**: 最小 4GB RAM
- **存储**: 最小 100MB 可用空间
- **网络**: 稳定的互联网连接（用于下载扩展）

### 已知限制

- 仅支持 UGC 3.0 和 2.0 版本
- 部分高级功能可能需要重启 VS Code
- 大型项目可能需要调整 VS Code 性能设置

## 注意事项

- 本仓库声明文件，与扩展仅面向 **UGC 3.0** & **UGC 2.0**，请勿用于其他版本
- 部分接口可能与实际游戏版本存在差异，请以游戏实际行为为准
- 如发现问题或需要补充 API，欢迎提交 [Issue](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) 或发起 Pull Request

## Star 历史

[![Star History Chart](https://api.star-history.com/chart?repos=UU-cmyk/MiniWorld-API-Desc&type=date&legend=top-left&sealed_token=4cyhbjVHKRN0PDaVtuWiTHVlDqVePSy4bhXV9-kk7E4mAvoA3Trj5OWw-BoAwRDDB-V8WyDJgFxBYsSqzpp4ygy20daMLZUrhQOa_RA0OYiQkMPonOTlgOHkVJbJczSog89zshYnQf_PDPnhpIOlre6oK7jsVZks9VhrSXEotmzuzAJpl-EIvX9jgxKz)](https://www.star-history.com/?repos=UU-cmyk%2FMiniWorld-API-Desc&type=date&legend=top-left)

## 贡献指南

欢迎为本项目贡献代码或提交问题！

### 报告问题

- 使用 [GitHub Issues](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) 报告 bug
- 提供详细的复现步骤和错误信息
- 附上相关的代码片段和日志

### 提交 Pull Request

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 创建 Pull Request

### 代码规范

- 遵循项目的 ESLint 配置
- 保持代码风格一致
- 添加适当的注释和文档
- 确保测试通过（如果有）

## 许可协议

本项目采用 [MIT](./LICENSE) 许可证发布

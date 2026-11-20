<div align="center">

# MiniWorld-API-Desc

《迷你世界》UGC Lua 开发的 API 声明库、代码补全插件与辅助工具集。

![GitHub stars](https://img.shields.io/github/stars/LK-cmyk/MiniWorld-API-Desc?style=flat)
![GitHub forks](https://img.shields.io/github/forks/LK-cmyk/MiniWorld-API-Desc?style=flat)
![License](https://img.shields.io/github/license/LK-cmyk/MiniWorld-API-Desc)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.125.0-blue)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-yellow)
<br>

![UGC 3.0](https://img.shields.io/badge/UGC-3.0-blue)
![UGC 2.0](https://img.shields.io/badge/UGC-2.0-blue)

[![English Version README](https://img.shields.io/badge/English-README-blue?logo=markdown)](./README.en.md)
</div>

> 本仓库提供的是 VS Code 扩展与声明文件，推荐使用扩展自动管理声明。

## 概览

MiniWorld API Description 是一个 VS Code 扩展，主要用于：

- 提供 UGC 2.0 / 3.0 的 Lua 类型声明
- 通过 `miniworld.completion` 自动切换补全模式
- 提供侧边栏 API 搜索
- 提供事件补全与相关缓存管理

## 功能说明

### 1. 类型声明与补全

扩展会根据 `miniworld.completion` 设定自动同步对应版本的声明目录到 Lua 语言服务。

可用值：

| 设置值 | 行为 |
| :-: | :-: |
| `2.0` | 自动加载 UGC 2.0 声明，并启用 2.0 事件补全 |
| `3.0` | 自动加载 UGC 3.0 声明，并启用 3.0 事件补全 |
| `off` | 移除 MiniWorld 声明，并关闭事件补全 |

默认值为 `2.0`。扩展会自动处理声明路径，同步全局 `Lua.workspace.library` 配置，且会清理旧版残留配置。

### 2. API 搜索

扩展提供侧边栏 API 搜索视图，可在编辑器中直接检索：

- 函数
- 枚举
- 事件

### 3. 事件补全

在 `ScriptSupportEvent:registerEvent([=[...]=], callback)` 等场景中，扩展会提供对应版本的事件名补全；`TriggerEvent.` / `ObjectEvent.` 后也可以补全 3.0 事件字段。两个版本的命名回调都支持事件参数字段补全与悬浮说明：3.0 从 `AddEvent/AddTriggerEvent` 反查，2.0 从 `ScriptSupportEvent:registerEvent` 反查。

### 4. 缓存管理

扩展提供了清空 ID 数据缓存命令，可重新下载并刷新缓存数据。

## 安装与使用

### 前置依赖

- [VS Code](https://code.visualstudio.com/) ^1.125.0
- [Lua Language Server](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)

### 安装方式

1. 下载发布的 `.vsix` 包
2. 在 VS Code 中执行：Extensions → `···` → `Install from VSIX...`
3. 选择下载的文件安装

### 首次配置

打开任意 `.lua` 文件后，扩展会按当前 `miniworld.completion` 设置自动同步对应声明版本；通常无需手动配置。

## 扩展命令

按 `Ctrl+Shift+P` 可在命令面板中找到这些命令：

| 命令 | 说明 |
| :-: | :-: |
| `MiniWorld API Description: 添加 MiniWorld UGC 声明` | 选择版本并设置 `miniworld.completion`，扩展自动同步声明 |
| `MiniWorld API Description: 清除 MiniWorld UGC 补全` | 清除补全配置，关闭补全能力 |
| `MiniWorld API Description: 打开 API 搜索` | 打开侧边栏 API 搜索视图 |
| `MiniWorld API Description: 刷新 API 搜索索引` | 重新扫描声明文件并更新索引 |
| `MiniWorld API Description: 清空 ID 数据缓存` | 清空缓存并重新下载 ID 数据 |

## 配置项

扩展支持以下设置：

| 配置项 | 说明 |
| :-: | :-: |
| `miniworld.completion` | 控制补全模式，支持 `2.0` / `3.0` / `off` |
| `miniworld.serverUrl` | 设置 ID 数据下载服务器地址，默认 `desc.cmyk.dpdns.org` |

## 兼容性

| 项目 | 版本 |
| :-: | :-: |
| 《迷你世界》游戏 | 相关 UGC 版本支持 |
| UGC 开发套件 | 2.0 / 3.0 |
| VS Code | ^1.125.0 |

## AI

- UGC 3.0
  - [API.txt](./docs/miniworld-ugc-30/references/API.txt)
  - [SKILL.md](./docs/miniworld-ugc-30/SKILL.md)
- UGC 2.0
  - [API.txt](./docs/miniworld-ugc-20/references/API.txt)

## 项目结构

```bash
MiniWorld-API-Desc/
├── addon/  # VS Code 扩展源码
├── declarations/  # 2.0 / 3.0 声明源
├── docs/  # 文档与参考资料
├── tools/  # Python 工具脚本
├── server/  # Cloudflare Worker
├── README.md  # 中文说明
├── README.en.md  # 英文说明
├── pyproject.toml  # Python 依赖配置
├── LICENSE  # 许可证
└── ...
```

## 注意事项

- 本扩展仅面向 UGC 2.0 / 3.0
- 部分接口可能与实际游戏行为存在差异，最终以游戏表现为准
- 若发现问题或需要补充 API，欢迎提交 Issue 或 Pull Request

## 许可协议

本项目采用 [MIT](./LICENSE) 许可证发布。

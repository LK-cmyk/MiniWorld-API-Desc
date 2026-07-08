# MiniWorld-API-Desc

![GitHub stars](https://img.shields.io/github/stars/LK-cmyk/MiniWorld-API-Desc?style=flat)
![GitHub forks](https://img.shields.io/github/forks/LK-cmyk/MiniWorld-API-Desc?style=flat)
![License](https://img.shields.io/github/license/LK-cmyk/MiniWorld-API-Desc)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.125.0-blue)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-yellow)

[![中文](https://img.shields.io/badge/中文-blue?logo=markdown)](./README.md) — [中文版](./README.md)

API declaration library, code completion extension, and helper tools for UGC Lua development in *Mini World* (迷你世界).

> **It is no longer recommended to manually configure declaration files. Use the VS Code extension instead.**  
> After installing the extension, press `Ctrl+Shift+P` and run the corresponding command to automatically set up the declaration paths — no manual configuration needed.

Provides complete Lua type declaration files that work with VS Code's [Lua Language Server (sumneko.lua)](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) to deliver intelligent autocompletion, type hints, and parameter documentation. Also includes an event completion extension, code snippet templates, and API comparison scripts to boost UGC component development productivity.

## Quick Start

### Prerequisites

- [VS Code](https://code.visualstudio.com/)
- [Lua Language Server extension (sumneko.lua)](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- Python 3.10+ (only needed for utility scripts)
- Node.js (only needed if building the extension yourself)

### Install the Extension

Download the `.vsix` file from [GitHub Releases](https://github.com/LK-cmyk/MiniWorld-API-Desc/releases), then in VS Code:

1. Open the Extensions panel (`Ctrl+Shift+X`)
2. Click the `···` menu in the top-right → `Install from VSIX...`
3. Select the downloaded `.vsix` file

After installation, press `Ctrl+Shift+P` and run **MiniWorld API Description: Add MiniWorld UGC 3.0 Declarations** or **MiniWorld API Description: Add MiniWorld UGC 2.0 Declarations** to enable type hints.

### First-Time Setup

When you open any `.lua` file, the extension automatically checks whether declaration paths are configured. If not, a prompt appears:

| Option | Behavior |
| :-: | :-: |
| **Don't add declarations** | Suppress prompt for 4 hours |
| **Never remind** | Suppress prompt permanently |
| **Add 2.0 / 3.0 declarations** | Show scope picker to write declaration paths to the selected scope |

2.0 and 3.0 declarations are mutually exclusive — they cannot coexist.

---

## Extension Commands

Press `Ctrl+Shift+P` and type `MiniWorld` to find all available commands:

| Command | Description |
| :-: | :-: |
| `MiniWorld API Description: Add MiniWorld UGC 2.0 Declarations` | Add the 2.0 declaration directory to `Lua.workspace.library` |
| `MiniWorld API Description: Remove MiniWorld UGC 2.0 Declarations` | Remove the 2.0 declaration directory from the config |
| `MiniWorld API Description: Add MiniWorld UGC 3.0 Declarations` | Add the 3.0 declaration directory to `Lua.workspace.library` |
| `MiniWorld API Description: Remove MiniWorld UGC 3.0 Declarations` | Remove the 3.0 declaration directory from the config |

When running add/remove commands, a scope picker appears:

| Scope | Description |
| :-: | :-: |
| **Global** | Write to user settings — affects all workspaces |
| **Workspace** | Write to `.vscode/settings.json` — affects the current workspace only |
| **Workspace Folder** | Write to workspace folder settings |

The extension automatically filters available options based on current config state: add commands only show scopes **not already containing** the declarations; remove commands only show scopes **currently containing** them.

---

## Project Structure

```bash
MiniWorld-API-Desc/
├── package.json                 # VS Code extension manifest
├── tsconfig.json                # TypeScript compilation config
├── eslint.config.mjs            # ESLint config
├── pack.ps1                     # Build & packaging script
├── .vscodeignore                # Extension publish ignore rules
├── addon/                       # VS Code extension source
│   ├── src/
│   │   └── extension.ts         # Extension main logic
│   └── types/                   # Declaration files
├── multiple/                    # Modular declaration files
│   ├── 2.0/                     # 28 module files
│   └── 3.0/                     # 25 module files
├── AiDesc/                      # AI-assisted description files
│   └── 3.0/
│       ├── AiDesc.md            # UGC 3.0 development guide (for AI)
│       └── MNAiDesc.txt         # Plain-text API description
├── tools/                       # Python utility scripts
│   ├── 2.0/                     # 2.0 toolset
│   │   ├── Merge.py
│   │   ├── FuncCompare.py
│   │   ├── EventCompare.py
│   │   └── DescToAiDesc.py
│   └── 3.0/                     # 3.0 toolset
│       ├── Merge.py
│       ├── FuncCompare.py
│       ├── EventCompare.py
│       ├── EnumLibCompare.py
│       └── DescToAiDesc.py
└── img/
    └── Logo-128px.png           # Extension icon
```

---

## Utility Scripts

Run the following commands from the project root (requires Python 3.10+, dependencies in `pyproject.toml`):

```bash
# Merge declarations
python tools/3.0/Merge.py              # Merge multiple/3.0/ into merged.3.0.lua
python tools/2.0/Merge.py              # Merge multiple/2.0/ into merged.2.0.lua

# API comparison (compare local declarations against official online docs)
python tools/3.0/FuncCompare.py        # 3.0 function comparison
python tools/3.0/EventCompare.py       # 3.0 event comparison
python tools/3.0/EnumLibCompare.py     # 3.0 enum comparison
python tools/2.0/FuncCompare.py        # 2.0 function comparison
python tools/2.0/EventCompare.py       # 2.0 event comparison

# AI description generation
python tools/3.0/DescToAiDesc.py       # Generate AiDesc/3.0/MNAiDesc.txt
python tools/2.0/DescToAiDesc.py       # Generate AiDesc/2.0/MNAiDesc.txt
```

---

## AI Usage

Provide the following files to an AI assistant to help it understand the UGC 3.0 API:

- **[AiDesc/3.0/AiDesc.md](./AiDesc/3.0/AiDesc.md)** — UGC 3.0 development guide covering script conventions, event usage, coordinate system, skybox, and more
- **[AiDesc/3.0/MNAiDesc.txt](./AiDesc/3.0/MNAiDesc.txt)** — Plain-text API description without type annotation markers, suitable for markup-sensitive scenarios

---

## Building from Source

Requires Node.js. Run from the project root:

```powershell
./pack.ps1                          # Full build & package
./pack.ps1 -CompileOnly             # Compile only, skip packaging
./pack.ps1 -SkipLint                # Skip lint check
./pack.ps1 -SkipInstall             # Skip npm install
./pack.ps1 -Clean                   # Clean build output only
```

After packaging, a `.vsix` file is generated in the project root, ready to install into VS Code.

---

## Compatibility

| Project | Version |
| :-: | :-: |
| *Mini World* game | v1.56+ |
| UGC SDK | 3.0 & 2.0 |
| Python | 3.10+ |
| VS Code | ^1.125.0 |

---

## Notes

- The declaration files and extension in this repository are designed for **UGC 3.0** & **UGC 2.0** only — do not use with other versions.
- Some APIs may differ from the actual game behavior; always refer to the game for the final word.
- If you find issues or need additional APIs, feel free to open an [Issue](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) or submit a Pull Request.

---

## License

[MIT](./LICENSE)

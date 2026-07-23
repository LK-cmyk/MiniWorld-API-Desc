# MiniWorld-API-Desc

![GitHub stars](https://img.shields.io/github/stars/LK-cmyk/MiniWorld-API-Desc?style=flat)
![GitHub forks](https://img.shields.io/github/forks/LK-cmyk/MiniWorld-API-Desc?style=flat)
![License](https://img.shields.io/github/license/LK-cmyk/MiniWorld-API-Desc)
![VS Code](https://img.shields.io/badge/VS%20Code-^1.125.0-blue)
![Lua](https://img.shields.io/badge/Lua-5.1%2B-yellow)
<br>

![UGC 3.0](https://img.shields.io/badge/UGC-3.0-blue)
![UGC 2.0](https://img.shields.io/badge/UGC-2.0-blue)

[![Chinese Version README](https://img.shields.io/badge/Chinese-README-blue?logo=markdown)](./README.md)

API declaration library, code completion plugin, and auxiliary toolset for MiniWorld UGC Lua development.

> **No longer recommended to use declaration files for declarations, declaration plugins are recommended.**  
> After installing this extension, you can automatically configure declaration paths by executing corresponding commands via `Ctrl+Shift+P`, no manual operation required.

📚 **Table of Contents**

- [Quick Start](#quick-start)
- [API Search](#api-search)
- [Plugin Commands](#plugin-commands)
- [Project Structure](#project-structure)
- [Tool Scripts](#tool-scripts)
- [AI Usage Recommendations](#ai-usage-recommendations)
- [Building from Source](#building-from-source)
- [Applicability](#applicability)
- [Contributing Guidelines](#contributing-guidelines)
- [Important Notes](#important-notes)
- [License](#license)

---

Provides complete Lua type declaration files,配合 VS Code's [Lua Language Service (sumneko.lua)](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) to get intelligent completion, type hints, and parameter documentation; also provides event completion plugins, code snippet templates, and API comparison scripts to enhance UGC component development efficiency.

## Quick Start

### Prerequisites

| Dependency | Required | Description |
| :-- | :-: | :-: |
| [VS Code](https://code.visualstudio.com/) | Yes | Provides code completion, type hints, and other features |
| [Lua Language Service Plugin (sumneko.lua)](https://marketplace.visualstudio.com/items?itemName=sumneko.lua) | Yes | Provides Lua language service, plugin installation required |
| Python 3.10+ | No | Only required when using tool scripts |
| Node.js | No | Only required when building extension from source |
| PowerShell 5.1+ | No | Only required when building extension from source |

### Install Extension

1. Download `.vsix` file from [GitHub Releases](https://github.com/LK-cmyk/MiniWorld-API-Desc/releases)
2. Open Extensions panel (`Ctrl+Shift+X`)
3. Click `···` in top-right corner → `Install from VSIX...`
4. Select the downloaded `.vsix` file

After installation, press `Ctrl+Shift+P` and execute any of the following commands to enable type hints

- `MiniWorld API Description: Add MiniWorld UGC 3.0 Declaration`
- `MiniWorld API Description: Add MiniWorld UGC 2.0 Declaration`

> 💡 2.0 and 3.0 declarations are mutually exclusive and cannot coexist

### First Use Workflow

When opening any `.lua` file, the plugin automatically checks if declaration paths are configured. If not configured, a prompt window appears:

| Option | Behavior |
| :-: | :-: |
| **Do not add declaration** | No prompt for 4 hours |
| **Never remind** | Never prompt again |
| **Add 2.0 / 3.0 declaration** | Opens scope selection, writes declaration path to specified scope |

## Plugin Commands

Press `Ctrl+Shift+P` to open command palette, enter keyword `MiniWorld` to find the following commands:

| Command | Description |
| :-: | :-: |
| `MiniWorld API Description: Add MiniWorld UGC 2.0 Declaration` | Add 2.0 declaration directory to `Lua.workspace.library` |
| `MiniWorld API Description: Remove MiniWorld UGC 2.0 Declaration` | Remove 2.0 declaration directory from configuration |
| `MiniWorld API Description: Add MiniWorld UGC 3.0 Declaration` | Add 3.0 declaration directory to `Lua.workspace.library` |
| `MiniWorld API Description: Remove MiniWorld UGC 3.0 Declaration` | Remove 3.0 declaration directory from configuration |
| `MiniWorld API Description: Open API Search` | Open API search panel for quick search of functions, enums, events |
| `MiniWorld API Description: Refresh API Search Index` | Rescan declaration files and update search index |

### Scopes

- When executing add/remove commands, you can choose the scope for configuration writing

  | Scope | Description |
  | :-: | :-: |
  | **Global** | Write to user settings, effective for all workspaces |
  | **Workspace** | Write to `.vscode/settings.json`, effective only for current workspace |
  | **WorkspaceFolder** | Write to workspace folder settings |

The plugin automatically filters available options based on the current configuration status of each scope: when adding, only shows scopes that do not include the declaration; when removing, only shows scopes that already include the declaration

### Usage Examples

```lua
-- Example using type hints
local actor = MNActor.create("testActor")
local pos = actor:GetPosition()  -- Smart completion and type hints
actor:SetPosition(pos.x + 1, pos.y, pos.z)
```

```lua
-- Using event system
local function onPlayerJoin(player)
    print("Player joined: " .. player.name)
end

MNGame.addEventListener("onPlayerJoin", onPlayerJoin)
```

## API Search

v0.6.1 introduces the **API Search Panel**, supporting quick search of all MiniWorld APIs in the VS Code sidebar without leaving the editor to browse documentation

### Opening Methods

| Method | Operation |
| :-: | :-: |
| **Command Palette** | `Ctrl+Shift+P` → Enter **MiniWorld API Description: Open API Search** |
| **Sidebar Button** | Click the 🔍 **MiniWorld API Search** icon in the left activity bar |

### Feature Introduction

- **Fuzzy Search** — Enter keywords to fuzzy match by name, parameters, description, supports first-letter abbreviations (e.g., enter `GP` to match `GetPosition`)
- **Filtering** — Filter by version (2.0 / 3.0), module, type (function / enum / event)
- **Detail View** — Click search results to view complete parameter lists, return values, enum values, and event parameters
- **Click to Jump** — Click result entries to jump to the source code location of the corresponding declaration file
- **Refresh Index** — Execute **MiniWorld API Description: Refresh API Search Index** command to rescan declaration files

### Keyboard Shortcuts

Press `Ctrl+K` in the search input box to quickly clear search content.

## Project Structure

```bash
MiniWorld-API-Desc/
├── package.json  # VS Code extension manifest
├── tsconfig.json  # TypeScript compilation configuration
├── eslint.config.mjs  # ESLint configuration
├── pack.ps1  # Build and packaging script
├── .vscodeignore  # Extension publishing ignore rules
├── addon/  # VS Code extension source code
├── multiple/  # Declaration files split by module
├── docs/  # Project documentation
├── tools/  # Python tool scripts
└── img/  # Image resources
```

## Tool Scripts

Run the following commands in the repository root directory (requires Python 3.12+, dependencies in `pyproject.toml`):

### Declaration Management

| Category | Command | Description |
| :-: | :-- | :-: |
| Declaration Merge | `python tools/3.0/Merge.py` | Merge multiple/3.0/ into merged.3.0.lua |
| Declaration Merge | `python tools/2.0/Merge.py` | Merge multiple/2.0/ into merged.2.0.lua |

### API Comparison

| Category | Command | Description |
| :-: | :-- | :-: |
| 3.0 Function Comparison | `python tools/3.0/FuncCompare.py` | Compare 3.0 version function differences |
| 3.0 Event Comparison | `python tools/3.0/EventCompare.py` | Compare 3.0 version event differences |
| 3.0 Enum Comparison | `python tools/3.0/EnumLibCompare.py` | Compare 3.0 version enum differences |
| 2.0 Function Comparison | `python tools/2.0/FuncCompare.py` | Compare 2.0 version function differences |
| 2.0 Event Comparison | `python tools/2.0/EventCompare.py` | Compare 2.0 version event differences |

### AI Tools

| Category | Command | Description |
| :-: | :-- | :-: |
| AI Description Generation | `python tools/3.0/DescToAiDesc.py` | Generate AiDesc/3.0/MNAiDesc.txt |
| AI Description Generation | `python tools/2.0/DescToAiDesc.py` | Generate AiDesc/2.0/MNAiDesc.txt |

## AI Usage Recommendations

Providing the following file contents to AI assistants can help them understand UGC:

- UGC 3.0
  - [SKILL.md](./docs/miniworld-ugc-30/SKILL.md)
  - [API.txt](./docs/miniworld-ugc-30/references/API.txt)
- UGC 2.0
  - [API.txt](./docs/miniworld-ugc-20/references/API.txt)

## Building from Source

Requires Node.js environment. Execute in the project root directory:

### Build Options

| Command | Description |
| :-- | :-: |
| `./pack.ps1` | Complete build (compile + check + package) |
| `./pack.ps1 -CompileOnly` | Compile only, do not package |
| `./pack.ps1 -SkipLint` | Skip lint check |
| `./pack.ps1 -SkipInstall` | Skip npm install |
| `./pack.ps1 -Clean` | Clean build output only |

### Build Process

```bash
npm install # 1. Install dependencies
tsc # 2. Compile TypeScript
./pack.ps1 # 3. Package extension
code --install-extension MiniWorld-API-Desc.vsix # 4. Install extension (optional)
```

After packaging, a `.vsix` file will be generated in the root directory, which can be directly installed to VS Code.

## Applicability

| Project | Version |
| :-- | :-: |
| MiniWorld Game | v1.56+ |
| UGC Development Kit | 3.0 & 2.0 |
| Python | 3.10+ |
| VS Code | ^1.125.0 |

### System Requirements

- **Operating System**: Windows, macOS, Linux
- **Memory**: Minimum 4GB RAM
- **Storage**: Minimum 100MB available space
- **Network**: Stable internet connection (for downloading extensions)

### Known Limitations

- Only supports UGC 3.0 and 2.0 versions
- Some advanced features may require VS Code restart
- Large projects may require VS Code performance adjustments

## Important Notes

- This repository's declaration files and extension are only for **UGC 3.0** & **UGC 2.0**, do not use for other versions
- Some interfaces may differ from actual game versions, please refer to actual game behavior
- If you find issues or need API additions, welcome to submit [Issues](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) or create Pull Requests

## Star History

[![Star History Chart](https://api.star-history.com/chart?repos=UU-cmyk/MiniWorld-API-Desc&type=date&legend=top-left&sealed_token=4cyhbjVHKRN0PDaVtuWiTHVlDqVePSy4bhXV9-kk7E4mAvoA3Trj5OWw-BoAwRDDB-V8WyDJgFxBYsSqzpp4ygy20daMLZUrhQOa_RA0OYiQkMPonOTlgOHkVJbJczSog89zshYnQf_PDPnhpIOlre6oK7jsVZks9VhrSXEotmzuzAJpl-EIvX9jgxKz)](https://www.star-history.com/?repos=UU-cmyk%2FMiniWorld-API-Desc&type=date&legend=top-left)

## Contributing Guidelines

Welcome to contribute code or submit issues to this project!

### Reporting Issues

- Use [GitHub Issues](https://github.com/LK-cmyk/MiniWorld-API-Desc/issues) to report bugs
- Provide detailed reproduction steps and error information
- Attach relevant code snippets and logs

### Submitting Pull Requests

1. Fork this repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Create Pull Request

### Code Standards

- Follow the project's ESLint configuration
- Maintain consistent code style
- Add appropriate comments and documentation
- Ensure tests pass (if any)

## License

This project is licensed under the [MIT](./LICENSE) license

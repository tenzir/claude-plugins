# Dev

Automatic file formatting hook for edited files. The plugin runs language-
specific formatters after `Write` and `Edit` operations so changed files stay
consistently formatted.

## ✨ Features

- 🔧 **Auto-formatting hook**: Runs after `Write` and `Edit` operations
- 🧠 **Config-aware formatting**: Detects Biome, ESLint, and Prettier configs
  before formatting JS, TS, and JSON files
- ✂️ **Hunk-based C++ formatting**: Uses changed staged hunks with
  `clang-format` when available
- 🐚 **Shell formatting fallback**: Uses `shfmt` directly or via `go run`
- 🐍 **Python formatting**: Runs `ruff format` and `ruff check --fix`

## 🚀 Usage

Install the plugin and edit files as usual. The hook runs automatically after
Claude writes or edits a file.

### Supported file types

| File Type                                    | Tool         | Config Required |
| -------------------------------------------- | ------------ | --------------- |
| `.cpp`, `.hpp`, `.*pp.in`                    | clang-format | No              |
| `.cmake`, `CMakeLists.txt`                   | cmake-format | No              |
| `.sh`, `.bash`                               | shfmt        | No              |
| `.md`, `.mdx`                                | markdownlint | No              |
| `.md`, `.mdx`                                | prettier     | No              |
| `.json`                                      | biome        | Yes             |
| `.json`                                      | prettier     | Yes             |
| `.yaml`, `.yml`                              | yamllint     | No              |
| `.py`                                        | ruff         | No              |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | biome        | Yes             |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | eslint       | Yes             |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | prettier     | Yes             |

For JS, TS, and JSON files, the hook searches upward from the edited file for
matching configuration files before it formats.

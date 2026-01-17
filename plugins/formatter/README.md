# Formatter

Auto-formats files after Claude edits using language-specific formatters and
linters. Runs silently after every Write or Edit operation, supporting C++,
CMake, Shell, Markdown, JSON, YAML, and JavaScript/TypeScript.

## ✨ Features

Keeps your code consistently formatted without manual intervention.

- 🔧 **Automatic**: Runs after every `Write` or `Edit` operation
- 🌐 **Multi-language**: Supports C++, CMake, Shell, Markdown, JSON, YAML, and JS/TS
- 🔍 **Project-aware**: Detects project config files to choose the right formatter
- 🤫 **Non-blocking**: Errors are shown but never fail the hook

## 🔧 Configuration

The plugin uses these formatters and linters (install the ones you need):

| File Type                                    | Tool         | Install                           |
| -------------------------------------------- | ------------ | --------------------------------- |
| `.cpp`, `.hpp`, `.*pp.in`                    | clang-format | `brew install clang-format`       |
| `.cmake`, `CMakeLists.txt`                   | cmake-format | `pip install cmake-format`        |
| `.sh`, `.bash`                               | shfmt        | `brew install shfmt`              |
| `.md`, `.mdx`                                | markdownlint | `npm install -g markdownlint-cli` |
| `.md`, `.mdx`                                | prettier     | `npm install -g prettier`         |
| `.json`                                      | biome        | `npm install -g @biomejs/biome`   |
| `.json`                                      | prettier     | `npm install -g prettier`         |
| `.yaml`, `.yml`                              | yamllint     | `pip install yamllint`            |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | biome        | `npm install -g @biomejs/biome`   |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | eslint       | `npm install -g eslint`           |
| `.js`, `.jsx`, `.ts`, `.tsx`, `.mjs`, `.cjs` | prettier     | `npm install -g prettier`         |

Shell formatting uses `.editorconfig` settings when available, otherwise falls
back to sensible defaults (2-space indent, switch case indentation, binary ops
may start lines).

## 🔍 Config Detection

The hook detects which formatter your project uses by searching for config files
from the edited file's directory up to the filesystem root:

| Tool     | Config files detected               |
| -------- | ----------------------------------- |
| Biome    | `biome.json`, `biome.jsonc`         |
| ESLint   | `eslint.config.*`, `.eslintrc*`     |
| Prettier | `.prettierrc*`, `prettier.config.*` |

For JavaScript/TypeScript files, the hook checks for Biome config first, then
ESLint, then Prettier. For JSON and Markdown files, it checks for Biome or
Prettier config respectively.

If no config is found, the hook skips formatting for that file type. This
prevents applying wrong formatting rules to projects that use different tools.

## 🚀 Usage

The plugin runs automatically after every `Write` or `Edit` operation. No
commands to remember.

When you ask Claude to edit a C++ file:

```
You: Add a debug log statement to process_data()
Claude: [Edit tool runs]
Formatter: [clang-format runs silently in background]
```

The file ends up formatted according to your `.clang-format` config, even if
Claude's edit had inconsistent spacing.

Different file types trigger their respective formatters:

| You edit...      | Formatter runs                               |
| ---------------- | -------------------------------------------- |
| `parser.cpp`     | clang-format                                 |
| `CMakeLists.txt` | cmake-format                                 |
| `deploy.sh`      | shfmt (uses `.editorconfig` if available)    |
| `README.md`      | markdownlint, then prettier (if config)      |
| `config.json`    | biome or prettier (based on project config)  |
| `pipeline.yaml`  | yamllint (linting only)                      |
| `app.tsx`        | biome, eslint, or prettier (based on config) |

If a formatter encounters an error, the message is shown but the hook continues
without failing. Missing formatters and unconfigured file types are silently
skipped.

## 📋 Hook Behavior

The hook uses error suppression and output redirection to stay non-blocking:

| Tool         | Suppress exit | Suppress stdout | Reason                              |
| ------------ | ------------- | --------------- | ----------------------------------- |
| clang-format | Yes           | No              | Silent on success, errors to stderr |
| cmake-format | Yes           | No              | Silent on success, errors to stderr |
| shfmt        | Yes           | No              | Silent on success, errors to stderr |
| markdownlint | Yes           | Yes             | Outputs unfixable issues to stdout  |
| prettier     | Yes           | Yes             | Outputs filenames to stdout         |
| biome        | Yes           | Yes             | Outputs results to stdout           |
| yamllint     | Yes           | Yes             | Outputs lint issues to stdout       |
| eslint       | Yes           | Yes             | Outputs issues to stdout            |

All tools suppress non-zero exits (`|| true`) because they fail on parse errors
or unfixable issues. Tools that output to stdout get `>/dev/null` to keep the
hook quiet while still showing stderr for actual failures.

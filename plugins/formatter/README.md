# Formatter

Auto-formats files after Claude edits using language-specific formatters and
linters. Runs silently after every Write or Edit operation, supporting C++,
CMake, Shell, Markdown, JSON, and YAML.

## ✨ Features

Keeps your code consistently formatted without manual intervention.

- 🔧 **Automatic**: Runs after every `Write` or `Edit` operation
- 🌐 **Multi-language**: Supports C++, CMake, Shell, Markdown, JSON, and YAML
- 🤫 **Silent**: Only warns when a formatter is missing

## 📦 Installation

```
/plugin install formatter@tenzir
```

## 🔧 Configuration

The plugin uses these formatters and linters (install the ones you need):

| File Type                  | Tool         | Install                           |
| -------------------------- | ------------ | --------------------------------- |
| `.cpp`, `.hpp`, `.*pp.in`  | clang-format | `brew install clang-format`       |
| `.cmake`, `CMakeLists.txt` | cmake-format | `pip install cmake-format`        |
| `.sh`, `.bash`             | shfmt        | `brew install shfmt`              |
| `.md`, `.mdx`              | markdownlint | `npm install -g markdownlint-cli` |
| `.md`, `.mdx`, `.json`     | prettier     | `npm install -g prettier`         |
| `.yaml`, `.yml`            | yamllint     | `pip install yamllint`            |

Shell formatting uses `.editorconfig` settings when available, otherwise falls
back to sensible defaults (2-space indent, switch case indentation, binary ops
may start lines).

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

| You edit...      | Formatter runs                            |
| ---------------- | ----------------------------------------- |
| `parser.cpp`     | clang-format                              |
| `CMakeLists.txt` | cmake-format                              |
| `deploy.sh`      | shfmt (uses `.editorconfig` if available) |
| `README.md`      | markdownlint, then prettier               |
| `config.json`    | prettier                                  |
| `pipeline.yaml`  | yamllint (linting only)                   |

If a formatter is missing, you get a warning but the edit still completes:

```
cmake-format not found, skipping auto-formatting
```

Install the formatters you need and ignore the rest.

# Formatter

Auto-formats files after Claude edits using language-specific formatters.

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

The plugin uses these formatters (install the ones you need):

| File Type                       | Formatter    | Install                           |
| ------------------------------- | ------------ | --------------------------------- |
| `.cpp`, `.hpp`                  | clang-format | `brew install clang-format`       |
| `.cmake`, `CMakeLists.txt`      | cmake-format | `pip install cmake-format`        |
| `.sh`, `.bash`                  | shfmt        | `brew install shfmt`              |
| `.md`                           | markdownlint | `npm install -g markdownlint-cli` |
| `.md`, `.json`, `.yaml`, `.yml` | prettier     | `npm install -g prettier`         |

## ⚙️ How it works

The plugin registers a `PostToolUse` hook that triggers on `Write` and `Edit`
operations. When a file is modified:

1. The hook extracts the file path from the tool output
2. Checks if the file extension matches a supported formatter
3. Runs the appropriate formatter in-place
4. Warns to stderr if a formatter is not installed

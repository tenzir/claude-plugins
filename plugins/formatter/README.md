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

| File Type                               | Formatter    | Install                           |
| --------------------------------------- | ------------ | --------------------------------- |
| `.cpp`, `.hpp`                          | clang-format | `brew install clang-format`       |
| `.cmake`, `CMakeLists.txt`              | cmake-format | `pip install cmake-format`        |
| `.sh`, `.bash`                          | shfmt        | `brew install shfmt`              |
| `.md`, `.mdx`                           | markdownlint | `npm install -g markdownlint-cli` |
| `.md`, `.mdx`, `.json`, `.yaml`, `.yml` | prettier     | `npm install -g prettier`         |

## 🚀 Usage

Simply install the required formatters for your project, then the plugin automatically formats files whenever you use the `Write` or `Edit` tools. Your code stays consistently formatted without any additional commands—just work as normal and formatting happens in the background.

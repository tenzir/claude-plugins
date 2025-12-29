# C++

C++ language support, tooling, and coding conventions for Claude Code.

## ✨ Features

- 🛠️ **LSP Integration**: Code intelligence via clangd (go-to-definition,
  find-references, hover, diagnostics)
- 📝 **Coding Conventions**: Style guidelines and clang tooling configuration

## 📦 Installation

```
/plugin install cpp@tenzir
```

## 🚀 Usage

### LSP

Open any C++ file to activate clangd language server for code intelligence.

### Coding Conventions

The `following-conventions` skill activates when editing `.cpp` or `.hpp` files.
It provides general C++ style guidance:

- Naming conventions (snake_case, CamelCase for templates)
- Class structure and special member rules
- Template metaprogramming style
- Documentation comments with Doxygen

Project-specific tooling configuration (clang-format, clang-tidy settings)
should be documented in the project's own `.claude/` directory.

## Related Plugins

- **formatter@tenzir**: Auto-formats C++ files with `clang-format` on
  Write/Edit operations

# C++

C++ language support, tooling, and coding conventions for Claude Code.

## ✨ Features

- 🔍 **LSP Integration**: Code intelligence via clangd (go-to-definition,
  find-references, hover, diagnostics)
- 📝 **Coding Conventions**: Style guidelines for C++ development (planned)

## 📦 Installation

```
/plugin install cpp@tenzir
```

## ⚙️ How it works

When you open a C++ file, Claude Code starts the clangd language server. This
provides code intelligence features like go-to-definition, find-references, and
hover information.

## 🔗 Related Plugins

- **formatter@tenzir**: Auto-formats C++ files with `clang-format` on
  Write/Edit operations

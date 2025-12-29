# Python

Python coding conventions and workflows for Tenzir projects. Covers uv-based
tooling, Ruff formatting, strict Mypy type checking, and naming conventions.

## ✨ Features

- 🐍 **Coding Conventions**: uv-based tooling, Ruff formatting, strict Mypy, naming conventions
- 🔍 **Pyright LSP Integration**: Pre-configured language server for enhanced type checking and IDE support

## 📦 Installation

```
/plugin install python@tenzir
```

## 🚀 Usage

### Skill: `python:following-conventions`

The skill activates automatically when editing `.py` files, running Ruff/Mypy/pytest, or working with `pyproject.toml`. It provides guidance on:

**Type Annotations** - Strict Mypy settings require explicit types:

```python
# Before: Mypy rejects implicit Any and untyped definitions
def process(data, config=None):
    return data.get("value")

# After: Explicit types, no implicit optional
def process(data: dict[str, str], config: Config | None = None) -> str:
    return data.get("value", "")
```

**Naming and Style** - Enforces `snake_case` functions, `PascalCase` classes, `CONSTANT_CASE` constants. Uses Click for CLIs with kebab-case flags (`--output-file`).

**Quality Gates** - Run before committing:

```sh
uv run ruff check && uv run ruff format --check && uv run mypy && uv run pytest
```

**Project Setup** - For new projects, the skill provides ready-to-use `pyproject.toml` templates with Tenzir metadata, Hatchling build config, and standard tool configurations.

## Requirements

- [uv](https://docs.astral.sh/uv/) - Dependency management and running tools

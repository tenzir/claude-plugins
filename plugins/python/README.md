# Python

Python coding conventions and workflows for Tenzir projects.

## ✨ Features

- 🛠️ **Coding Conventions**: uv-based tooling, Ruff formatting, strict Mypy, naming conventions

## 📦 Installation

```
/plugin install python@tenzir
```

## ⚙️ How it works

### Writing Python Code Skill

The `python:following-conventions` skill provides comprehensive guidance on:

- **Quality gates**: Chained checks (ruff, mypy, pytest, uv build) that fail fast
- **Formatting**: 4-space indentation, double quotes, 88 char lines via Ruff
- **Type hints**: Strict Mypy enforcement, no untyped public APIs
- **Naming**: `snake_case` for functions/variables, `PascalCase` for classes, `CONSTANT_CASE` for constants
- **Testing**: `test_*.py` pattern, ≥80% coverage, `tmp_path` for filesystem tests
- **Project structure**: `src/` layout, tests mirroring module names

## Requirements

- [uv](https://docs.astral.sh/uv/) - Dependency management and running tools

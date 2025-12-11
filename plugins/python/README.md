# Python

Python coding conventions and workflows for Tenzir projects.

## ✨ Features

- 🛠️ **Coding Conventions**: uv-based tooling, Ruff formatting, strict Mypy, naming conventions
- 🚀 **Release Command**: Step-by-step guidance for Python project releases via `/python:release`

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

### Release Command

Invoke `/python:release` to get guided through the full release workflow:

1. Pre-release validation (lint, format, types, tests, build)
2. Stage release with `uvx tenzir-changelog release create vX.Y.Z`
3. Version bump with `uv version --bump <part>`
4. Commit and publish with `uvx tenzir-changelog release publish`

## Requirements

- [uv](https://docs.astral.sh/uv/) - Dependency management and running tools
- [tenzir-changelog](https://github.com/tenzir/tenzir-changelog) - For releases (installable via `uvx`)
- [gh](https://cli.github.com/) - GitHub CLI for publishing releases

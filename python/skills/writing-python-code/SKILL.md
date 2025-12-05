---
name: writing-python-code
description: Write and review Python code in Tenzir projects. Use when editing .py files, running ruff/mypy/pytest, setting up pyproject.toml, or asking about Python style, type hints, or project structure.
---

# Python Coding Conventions

Coding standards for Python projects at Tenzir.

## Required Tools

All projects use:

- **uv** — Dependency management and virtual environments
- **Ruff** — Linting and formatting
- **Mypy** — Static type checking
- **pytest** — Testing

## Quality Gates

Run before committing or releasing:

```sh
uv run ruff check \
  && uv run ruff format --check \
  && uv run mypy \
  && uv run pytest \
  && uv build
```

The chain fails fast on the first error.

## Python Version

Target the latest stable Python (currently 3.12+). Do not write backwards-compatible
code for older versions—use modern syntax and stdlib features freely.

## Coding Style

### Formatting

- Ruff controls whitespace: 4-space indentation, double-quoted strings
- 88 character line limit (Ruff/Black default)
- Let Ruff order imports automatically

### Type Hints

- All public surfaces must be fully typed
- Strict Mypy settings reject untyped or partial definitions
- Avoid `Any`; fix warnings rather than ignoring them

### Naming Conventions

| Element   | Convention      | Example             |
| --------- | --------------- | ------------------- |
| Modules   | `snake_case`    | `my_module.py`      |
| Functions | `snake_case`    | `calculate_total()` |
| Variables | `snake_case`    | `user_count`        |
| Classes   | `PascalCase`    | `DataProcessor`     |
| Constants | `CONSTANT_CASE` | `MAX_RETRIES`       |

### CLI Conventions

- Use [Click](https://click.palletsprojects.com/) for CLI applications, not argparse
- Use kebab-case for CLI flags: `--output-file`, not `--output_file`
- Keep user messages concise

## Documentation Style

- Write in active voice; rewrite passive sentences before committing
- Focus on user-facing impact, not implementation details
- Use explicit imports; isolate configuration helpers in `config.py`

## Project Setup

Only read the specific file you need when setting up a new project or modifying
that tool's configuration:

- [project-structure.md](./project-structure.md) — Directory layout and testing conventions
- [pyproject.md](./pyproject.md) — Project metadata and build config
- [ruff.md](./ruff.md) — Ruff linting and formatting config
- [mypy.md](./mypy.md) — Mypy type checking config
- [pytest.md](./pytest.md) — Pytest runner config
- [coverage.md](./coverage.md) — Coverage reporting config
- [dev-dependencies.md](./dev-dependencies.md) — Dev dependency group

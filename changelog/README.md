# Changelog

Manage changelogs and release notes with tenzir-changelog.

## Features

- **Changelog Skill**: Auto-triggered assistance for creating and managing changelog entries
- **Release Command**: Step-by-step guidance for Python project releases via `/python-release`

## Installation

```
/plugin install changelog@tenzir
```

## How it works

### Changelog Skill

The `changelog` skill activates automatically when Claude detects you're:

- Completing a feature, bugfix, or breaking change
- Asking about changelog entries
- Working on PR descriptions

It provides guidance on:

- Entry file format (YAML frontmatter + Markdown)
- Entry types: `breaking`, `feature`, `bugfix`, `change`
- Commands: `uvx tenzir-changelog add`, `show`, `validate`

### Python Release Command

Invoke `/python-release` to get guided through the full release workflow:

1. Pre-release validation with `uv run check-release`
2. Stage release with `uvx tenzir-changelog release create vX.Y.Z`
3. Version bump with `uv version --bump <part>`
4. Commit and publish with `uvx tenzir-changelog release publish`

## Requirements

- [tenzir-changelog](https://github.com/tenzir/tenzir-changelog) - Installable via `uvx` or `pip`
- [uv](https://docs.astral.sh/uv/) - For version management and running tools
- [gh](https://cli.github.com/) - GitHub CLI for publishing releases

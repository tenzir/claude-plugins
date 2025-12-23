# Changelog

Manage changelogs and release notes with tenzir-changelog.

## ✨ Features

- 📋 **Managing Entries Skill**: Auto-triggered assistance for creating and managing changelog entries
- ➕ **Add Command**: Create changelog entries via `/changelog:add`
- 🚀 **Release Command**: Generic release workflow via `/changelog:release`
- 🤖 **Adder Agent**: Non-interactive agent for CI automation via `changelog:adder`

## 📦 Installation

```
/plugin install changelog@tenzir
```

## ⚙️ How it works

### Managing Entries Skill

The `changelog:managing-entries` skill activates automatically when Claude detects you're:

- Completing a feature, bugfix, or breaking change
- Asking about changelog entries
- Working on PR descriptions

It provides guidance on:

- Entry file format (YAML frontmatter + Markdown)
- Entry types: `breaking`, `feature`, `bugfix`, `change`
- Commands: `uvx tenzir-changelog add`, `show`, `validate`

## 🔄 CI Integration

With the [Claude GitHub App](https://github.com/apps/claude) installed, comment on any PR:

```
@claude add a changelog entry
```

Claude uses the `changelog:adder` agent to analyze the PR and create an appropriate entry.

## Requirements

- [tenzir-changelog](https://github.com/tenzir/changelog) - Installable via `uvx` or `pip`
- [Claude GitHub App](https://github.com/apps/claude) installed on the repository

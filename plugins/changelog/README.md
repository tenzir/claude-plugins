# Changelog

Manage changelogs and release notes with tenzir-changelog.

## ✨ Features

- 📋 **Managing Changelogs Skill**: Auto-triggered assistance for creating and managing changelog entries
- ➕ **Add Command**: Create changelog entries via `/changelog:add`
- 🚀 **Release Command**: Generic release workflow via `/changelog:release`

## 📦 Installation

```
/plugin install changelog@tenzir
```

## ⚙️ How it works

### Managing Changelogs Skill

The `managing-changelogs` skill activates automatically when Claude detects you're:

- Completing a feature, bugfix, or breaking change
- Asking about changelog entries
- Working on PR descriptions

It provides guidance on:

- Entry file format (YAML frontmatter + Markdown)
- Entry types: `breaking`, `feature`, `bugfix`, `change`
- Commands: `uvx tenzir-changelog add`, `show`, `validate`

## Requirements

- [tenzir-changelog](https://github.com/tenzir/tenzir-changelog) - Installable via `uvx` or `pip`

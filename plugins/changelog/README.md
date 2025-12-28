# Changelog

Manage changelogs and release notes with tenzir-changelog.

## ✨ Features

- 📋 **Managing Entries Skill**: Get guided assistance when creating changelog entries—activates automatically during relevant workflow
- ➕ **Add Command**: Interactive entry creation with `/changelog:add`
- 🚀 **Release Command**: Orchestrate releases with `/changelog:release`—stages, reviews, and publishes in one workflow
- 🤖 **Adder Agent**: Automate PR-triggered changelog creation via GitHub comments

## 📦 Installation

```
/plugin install changelog@tenzir
```

## 🚀 Usage

### Managing Entries Skill

Invoke `/changelog:managing-entries` to get guided assistance when creating or updating changelog entries. This skill activates automatically when you're finishing features, bugfixes, breaking changes, or asking about changelog workflow.

### Add Command

Use `/changelog:add` to create a new changelog entry interactively. Claude will help you choose the entry type and format it correctly.

## 🔄 CI Integration

With the [Claude GitHub App](https://github.com/apps/claude) installed, comment `@claude add a changelog entry` on any PR. The `changelog:adder` agent analyzes your changes and automatically creates a matching changelog entry.

## Requirements

- [tenzir-changelog](https://github.com/tenzir/changelog) - Installable via `uvx` or `pip`
- [Claude GitHub App](https://github.com/apps/claude) installed on the repository

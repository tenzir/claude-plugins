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

Use the reusable workflow to enable `@claude changelog` mentions in PRs:

```yaml
# .github/workflows/claude-changelog.yaml
name: Claude Changelog Entry

on:
  issue_comment:
    types: [created]

jobs:
  add-changelog-entry:
    if: |
      github.event.issue.pull_request &&
      contains(github.event.comment.body, '@claude') &&
      contains(toLower(github.event.comment.body), 'changelog')
    uses: tenzir/claude-plugins/.github/workflows/changelog-add.yaml@main
    secrets:
      ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
```

Then comment on any PR with `@claude add a changelog entry`.

## Requirements

- [tenzir-changelog](https://github.com/tenzir/changelog) - Installable via `uvx` or `pip`
- `ANTHROPIC_API_KEY` secret (for CI integration)

# Git

Git workflows for Tenzir repositories.

## ✨ Features

- 📝 **Writing Commit Messages**: Auto-triggered guidance for writing clear, consistent git commit messages
- 🔀 **PR Command**: Create GitHub pull requests with proper descriptions
- 🤖 **Committer Subagent**: Lightweight agent (Haiku) that handles the commit workflow autonomously

## 📦 Installation

```
/plugin install git@tenzir
```

## 🚀 Usage

### `/git:commit`

Commit staged changes with a well-formatted message. Splits orthogonal changes
into separate commits when needed.

### `/git:pr`

Create a GitHub pull request for your current changes. Run your project's
quality gates (linting, formatting, builds) first.

### `git:committer` subagent

Delegate the entire commit workflow. Use when you want hands-off committing
without step-by-step interaction.

### `git:writing-commit-messages` skill

Activates automatically when committing. Guides commit message format and style.

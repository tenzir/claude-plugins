# Git

Git workflows for Tenzir repositories.

## ✨ Features

- 📝 **Writing Commit Messages**: Auto-triggered guidance for writing clear, consistent git commit messages
- 🤖 **Committer Subagent**: Lightweight agent (Haiku) that handles the commit workflow autonomously

## 📦 Installation

```
/plugin install git@tenzir
```

## ⚙️ How it works

### Writing Commit Messages Skill

The `writing-commit-messages` skill activates when committing changes. It provides guidance on:

- Commit message format (subject under 50 chars, body wrapped at 72)
- Writing style focused on user capability, not implementation
- Best practices for atomic, self-contained commits

### Committer Subagent

The `committer` subagent is a lightweight Haiku-based agent that handles the
entire commit workflow. It executes the `/git:commit` slash command internally,
which:

1. Gathers git context (status, diff, recent commits)
2. Analyzes change cohesion and splits commits if needed
3. Checks for project requirements (changelogs, version bumps)
4. Creates commits with properly formatted messages

Use this subagent when you want to delegate the commit process entirely.

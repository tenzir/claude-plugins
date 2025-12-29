# Git

Git workflows for Tenzir repositories. Provides commands for committing with
well-formatted messages, creating pull requests, and addressing review comments
systematically.

## ✨ Features

- 📝 **Commit Command**: Stage and commit changes with cohesion analysis to split orthogonal changes
- 🔀 **PR Command**: Create GitHub pull requests with proper descriptions
- 💬 **Address PR Comments**: Work through review comments with commits and thread resolution
- 🤖 **Committer Subagent**: Lightweight agent (Haiku) that handles the commit workflow autonomously
- 📖 **Writing Commit Messages Skill**: Guides commit message format and style when committing

## 📦 Installation

```
/plugin install git@tenzir
```

## 🚀 Usage

### Committing changes

Use `/git:commit` after making changes:

```
> /git:commit
Detected 2 orthogonal changes in staged files:
1. Add user validation to signup form
2. Fix typo in error messages
Which would you like to commit first? [1/2]
```

For hands-off commits, delegate to the `@git:committer` subagent. It runs on
Haiku and makes decisions autonomously—splitting orthogonal changes and creating
separate commits without prompting:

```
> @git:committer commit my changes
Creating 2 commits...
✓ Add user validation to signup form
✓ Fix typo in error messages
```

Use the command when you want control over commit grouping. Use the subagent
when you trust it to split and commit everything correctly.

### Creating pull requests

Run your project's quality gates first (linting, tests, build), then:

```
> /git:pr
Switching to topic/add-user-validation...
Committing changes...
Pushing to origin...
Creating PR...
✓ https://github.com/org/repo/pull/42
```

The command handles branch creation, committing, and pushing in one step.

### Addressing review comments

After receiving PR feedback:

```
> /git:address-pr-comments
Found 3 unresolved comments:
- [grouped] Rename "config" to "settings" (2 files)
- Fix off-by-one error in pagination
Proceed? [y/n]
```

For a specific PR: `/git:address-pr-comments 42`

Each comment becomes a commit, with automatic thread replies and resolution.

### Writing commit messages

The `git:writing-commit-messages` skill activates during any commit workflow.
It guides message format (imperative mood, under 50 chars) and style
(user-focused, not implementation-focused).

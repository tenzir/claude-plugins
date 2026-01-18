# Ship

Release engineering for projects using the `tenzir-ship` CLI. Provides commands
for managing changelog entries, orchestrating releases, and parallel code review.

## ✨ Features

- 🌱 **Prepare Command**: Start fresh with `/ship:prepare`
- 🔍 **Review Command**: Parallel code review with `/ship:review`
- ✅ **Finalize Command**: Changelog, commit, and push with `/ship:finalize`
- ➕ **Add Command**: Create changelog entries with `/ship:add`
- 🚀 **Release Command**: Orchestrate releases with `/ship:release`
- 🤖 **Preparer Agent**: Non-interactive agent for branch/worktree setup
- 🤖 **Finalizer Agent**: Non-interactive agent for changelog, commit, and PR
- 🤖 **Adder Agent**: Non-interactive agent for CI automation of changelog entries
- 👁️ **Reviewer Agents**: Six specialized reviewers for parallel code review

## 🚀 Usage

### Preparing to Work

Use `/ship:prepare` to start fresh:

```
/ship:prepare
```

This fetches the latest from origin and creates a topic branch. For isolated
work, use a worktree:

```
/ship:prepare worktree
```

### Reviewing Changes

Use `/ship:review` to run parallel code review:

```
/ship:review
```

Claude spawns six specialized reviewers in parallel:

| Reviewer                      | Focus                     | Output                   |
| ----------------------------- | ------------------------- | ------------------------ |
| `@ship:reviewers:ux`          | User experience, clarity  | `.review/ux.md`          |
| `@ship:reviewers:docs`        | Documentation quality     | `.review/docs.md`        |
| `@ship:reviewers:tests`       | Test coverage, edge cases | `.review/tests.md`       |
| `@ship:reviewers:arch`        | API design, modularity    | `.review/arch.md`        |
| `@ship:reviewers:security`    | Input validation, secrets | `.review/security.md`    |
| `@ship:reviewers:consistency` | Naming, code style        | `.review/consistency.md` |

Each reviewer scores findings on a 0-100 confidence scale. Only findings with
confidence 80+ are reported.

**Scope auto-detection:**

1. If staged changes exist → review staged only
2. Else if unstaged changes exist → review unstaged
3. Else → review entire branch since merge-base

### Finalizing Changes

Use `/ship:finalize` to wrap up your work:

```
/ship:finalize
```

This creates a changelog entry, commits all changes, and pushes to remote.

### Adding Entries

After completing work, run `/ship:add`:

```
/ship:add
```

Claude analyzes your uncommitted changes and recent commits, then:

1. Suggests an entry type (`feature`, `bugfix`, `breaking`, or `change`)
2. Proposes a user-facing title
3. Drafts a description explaining what changed and why
4. Creates the entry file in `changelog/unreleased/`

For module-based projects, Claude targets the correct module's changelog automatically.

### Creating Releases

When ready to ship, run `/ship:release`:

```
/ship:release
```

Claude walks you through the full workflow:

1. Runs quality gates (linters, tests, build)
2. Determines version bump type (patch/minor/major)
3. Synthesizes a release title from unreleased entries
4. Generates release notes with an intro summary
5. Bumps version files (`pyproject.toml`, `package.json`, etc.)
6. Commits, tags, and publishes to GitHub

### Querying Entries

The `tenzir-ship` CLI provides direct access for inspection:

```sh
# Show unreleased entries
uvx tenzir-ship show

# Show specific entry details
uvx tenzir-ship show --json 1

# Preview release notes for a version
uvx tenzir-ship show --release v1.0.0 --json

# Validate all entries
uvx tenzir-ship validate
```

## 🔄 CI Integration

With the [Claude GitHub App](https://github.com/apps/claude) installed:

- **Add entries**: Comment `@claude add a changelog entry` on any PR. The app
  spawns the `@ship:adder` agent to analyze changes and create a matching entry.
- **Create releases**: Comment `@claude create a minor release` (or
  `major`/`patch`). The app spawns the releaser agent to run the full workflow.

The app parses comment intent and routes to the appropriate agent automatically.

## Requirements

- [tenzir-ship](https://github.com/tenzir/ship) - Installable via `uvx` or `pip`
- [Claude GitHub App](https://github.com/apps/claude) installed on the repository

## Dependencies

This plugin uses agents from other plugins:

- `@git:committer` - Used by `/ship:finalize` and `/ship:add` to create commits

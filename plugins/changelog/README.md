# Changelog

Manage changelogs and release notes with tenzir-changelog. Provides interactive
commands for adding entries, orchestrating releases, and automating changelog
workflows through CI.

## ✨ Features

- 🎯 **Managing Entries Skill**: Get guided assistance when creating changelog entries. Activates automatically when finishing features, bugfixes, or documenting changes.
- ➕ **Add Command**: Interactive entry creation with `/changelog:add`
- 🚀 **Release Command**: Orchestrate releases with `/changelog:release`. Stages, reviews, and publishes in one workflow.
- 🤖 **Adder Agent**: Automate changelog entry creation from PR comments in CI
- 📦 **Releaser Agent**: Automate release workflows in CI with a specified version bump

## 🚀 Usage

### Adding Entries

After completing work, run `/changelog:add`:

```
/changelog:add
```

Claude analyzes your uncommitted changes and recent commits, then:

1. Suggests an entry type (`feature`, `bugfix`, `breaking`, or `change`)
2. Proposes a user-facing title
3. Drafts a description explaining what changed and why
4. Creates the entry file in `changelog/unreleased/`

For module-based projects, Claude targets the correct module's changelog automatically.

### Creating Releases

When ready to ship, run `/changelog:release`:

```
/changelog:release
```

Claude walks you through the full workflow:

1. Runs quality gates (linters, tests, build)
2. Asks for version bump type (patch/minor/major)
3. Synthesizes a release title from unreleased entries
4. Generates release notes with an intro summary
5. Bumps version files (`pyproject.toml`, `package.json`, etc.)
6. Commits, tags, and publishes to GitHub

### Querying Entries

The skill provides direct CLI access for inspection:

```sh
# Show unreleased entries
uvx tenzir-changelog show

# Show specific entry details
uvx tenzir-changelog show --json 1

# Preview release notes for a version
uvx tenzir-changelog release notes --json v1.0.0

# Validate all entries
uvx tenzir-changelog validate
```

## 🔄 CI Integration

With the [Claude GitHub App](https://github.com/apps/claude) installed:

- **Add entries**: Comment `@claude add a changelog entry` on any PR. The `adder` agent analyzes changes and creates a matching entry.
- **Create releases**: Comment `@claude create a minor release` (or `major`/`patch`). The `releaser` agent runs the full release workflow autonomously.

## Requirements

- [tenzir-changelog](https://github.com/tenzir/changelog) - Installable via `uvx` or `pip`
- [Claude GitHub App](https://github.com/apps/claude) installed on the repository

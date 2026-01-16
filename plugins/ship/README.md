# Ship

Release engineering for projects using the `tenzir-ship` CLI. Provides commands
for managing changelog entries and orchestrating releases.

## ✨ Features

- ➕ **Add Command**: Create changelog entries with `/ship:add`
- 🚀 **Release Command**: Orchestrate releases with `/ship:release`
- 🤖 **Adder Agent**: Non-interactive agent for CI automation of changelog entries

## 🚀 Usage

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

- **Add entries**: Comment `@claude add a changelog entry` on any PR. The `adder` agent analyzes changes and creates a matching entry.
- **Create releases**: Comment `@claude create a minor release` (or `major`/`patch`). The `releaser` agent runs the full release workflow autonomously.

## Requirements

- [tenzir-ship](https://github.com/tenzir/ship) - Installable via `uvx` or `pip`
- [Claude GitHub App](https://github.com/apps/claude) installed on the repository

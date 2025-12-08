---
name: changelog-management
description: Create and manage changelog entries. Use when adding changelog entries, finishing features or bugfixes, documenting changes, writing release notes, working in changelog/ directories, or wrapping up commits and PRs.
---

# Changelog and Release Notes Management

This skill helps you create and manage changelog entries and release notes using the `tenzir-changelog` framework.

## When to Use

- After completing a feature, bugfix, or breaking change
- When the user asks to create a changelog entry
- When working on PR descriptions that reference changelog items
- When validating existing changelog entries
- When viewing or exporting release notes

## Setup

Initialize a changelog in a new project:

```bash
uvx tenzir-changelog add
```

The first invocation creates a `changelog/` subdirectory with `config.yaml` and `unreleased/`, inferring defaults from the parent directory name. When you provide an explicit `--root` flag, the CLI uses that directory directly instead of creating a subdirectory.

## Entry Types

| Type       | Use When                                                                    |
| ---------- | --------------------------------------------------------------------------- |
| `breaking` | User action required (API changes, removed features, renamed options)       |
| `feature`  | New capability that didn't exist before                                     |
| `bugfix`   | Something was broken and is now fixed (crashes, wrong output, regressions)  |
| `change`   | Modifications to existing functionality (improvements, refactoring, tweaks) |

**Choosing between `bugfix` and `change`:** If something was broken and is now fixed, use `bugfix`. If something worked correctly but is now better (faster, cleaner, more maintainable), use `change`.

## Entry File Format

Entries are Markdown files with YAML frontmatter. Unreleased entries live in `changelog/unreleased/`, and released entries are archived in `changelog/releases/<version>/entries/`:

```markdown
---
title: Brief description of the change
type: feature
authors:
  - Author Name
prs:
  - 123
component: optional-component-label
created: 2025-01-15T10:30:00Z
---

Optional extended description with more details about the change.
Can include multiple paragraphs and formatting.
```

### Required Fields

- `title` - Entry heading (keep concise)
- `type` - One of: `breaking`, `feature`, `bugfix`, `change`
- `created` - ISO 8601 UTC timestamp

### Optional Fields

- `author` / `authors` - Contributor name(s)
- `pr` / `prs` - Pull request number(s)
- `component` - Component label (if project uses components)

## Directory Structure

```
changelog/
├── config.yaml           # Project configuration
├── unreleased/           # Pending entries (add new entries here)
│   ├── feature-x.md
│   └── bugfix-y.md
└── releases/             # Versioned releases
    └── v1.0.0/
        ├── manifest.yaml # Release metadata
        ├── notes.md      # Generated release notes
        └── entries/      # Archived changelog entries
```

## Commands

### Add an Entry

```bash
uvx tenzir-changelog add \
  --title "Add feature X" \
  --type feature \
  --description-file /path/to/description.md \
  --co-author claude \
  --component api \
  --component cli \
  --pr 123 \
  --pr 456
```

Always pass `--description-file` to skip the interactive editor and avoid shell escaping issues. Pass `--component`, `--pr`, and `--co-author` multiple times for multiple values.

The CLI infers the primary author from environment variables or the GitHub CLI. Use `--co-author` to credit additional contributors (ideal for AI-assisted development). Use `--author` only to override the inferred author entirely.

### Show Entries

```bash
# Show unreleased entries in table format
uvx tenzir-changelog show

# Show detailed metadata for a specific entry (card view)
uvx tenzir-changelog show -c 1

# Show as markdown
uvx tenzir-changelog show --format markdown

# Filter by type
uvx tenzir-changelog show --type feature

# Show a specific release
uvx tenzir-changelog show --version v1.0.0
```

### Validate

```bash
uvx tenzir-changelog validate
```

Checks entry structure, required fields, and manifest consistency. Reports missing metadata, duplicate IDs, and config drift.

### Preview Release Notes

Preview release notes without modifying files:

```bash
uvx tenzir-changelog release notes v1.0.0
```

### Multi-Project Support

Coordinate changelogs across multiple projects:

```bash
# Show entries from multiple projects
uvx tenzir-changelog show --root ~/core --root ~/cloud

# Generate unified release notes
uvx tenzir-changelog show -m v5.0.0 --root ~/core --root ~/cloud > release-notes.md
```

## Best Practices

1. **Standalone first sentence** - The first sentence of the body must summarize the entire change, as compact mode only displays this
2. **One entry per logical change** - Don't combine unrelated changes
3. **Write for users** - Explain what changed and why it matters
4. **Use present tense** - "Add feature" not "Added feature"
5. **Link PRs** - Always include PR numbers for traceability
6. **Breaking changes** - Clearly explain migration steps in the body
7. **Preview first** - Always preview releases before committing
8. **Validate in CI** - Automate validation to enforce metadata completeness
9. **Consistent components** - Document and reuse component labels
10. **Use Markdown deliberately** - Frame code and technical terms in backticks (e.g., `--option 42`, `cmd`). Use _emphasis_ and **bold** where it improves clarity

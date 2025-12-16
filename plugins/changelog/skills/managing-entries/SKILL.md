---
name: managing-entries
description: Create and manage changelog entries. Use when adding changelog entries, finishing features or bugfixes, documenting changes, writing release notes, working in changelog/ directories, wrapping up commits and PRs, or cutting a release.
---

# Changelog and Release Notes Management

This skill helps you create and manage changelog entries and release notes using the `tenzir-changelog` framework.

## When to Use

- After completing a feature, bugfix, or breaking change
- When the user asks to create a changelog entry
- When working on PR descriptions that reference changelog items
- When validating existing changelog entries
- When viewing or exporting release notes

## Entry Types

| Type       | Use When                                                                    |
| ---------- | --------------------------------------------------------------------------- |
| `breaking` | User action required (API changes, removed features, renamed options)       |
| `feature`  | New capability that didn't exist before                                     |
| `bugfix`   | Something was broken and is now fixed (crashes, wrong output, regressions)  |
| `change`   | Modifications to existing functionality (improvements, refactoring, tweaks) |

## Use Cases

### Add an Entry

Use the `/changelog:add` slash command.

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

## Best Practices

1. **One entry per logical change** - Don't combine unrelated changes
2. **Link PRs** - Always include PR numbers for traceability
3. **Breaking changes** - Clearly explain migration steps in the body
4. **Preview first** - Always preview releases before committing
5. **Validate in CI** - Automate validation to enforce metadata completeness

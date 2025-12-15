---
description: Add a changelog entry for recent changes (feature, bugfix, breaking, change).
---

Make sure you loaded the `changelog:managing-entries` skill.

# Add Changelog Entry

Guide me through adding a changelog entry for recent work.

## Gather Context

Introspect the local repository to understand what changed. Look at staged
changes, recent commits, and uncommitted work. Use this context to suggest an
appropriate entry type and title.

## Determine Target Changelog

For module-based projects (those with `modules:` in the parent `config.yaml`):

1. Identify which module the change affects
2. Use `--root <module>/changelog` to target that module's changelog
3. For cross-cutting changes affecting multiple modules, use the parent changelog

For standalone projects, the default changelog directory is used.

## Determine Entry Details

Infer the following from the repository context:

1. **Entry type**
2. **Title**
3. **Description**

## Create the Entry

First, write the description to a temporary file, e.g., in /tmp.

Then create the entry:

```sh
uvx tenzir-changelog add \
  --title "<title>" \
  --type <type> \
  --description-file /tmp/changelog-description.md \
  --co-author claude \
  --root <module>/changelog  # For module-based projects
```

Omit `--description-file` if no description was provided.

Omit `--root` for standalone projects or when targeting the parent changelog.

## Verify

After creating the entry, show the result:

```sh
uvx tenzir-changelog show --markdown 1
```

Confirm the entry looks correct and inform the user where the file was created.

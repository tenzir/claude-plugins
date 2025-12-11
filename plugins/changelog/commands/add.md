---
description: Add a changelog entry for recent changes (feature, bugfix, breaking, change).
---

Make sure you loaded the `changelog-management` skill.

# Add Changelog Entry

Guide me through adding a changelog entry for recent work.

## Gather Context

Introspect the local repository to understand what changed. Look at staged
changes, recent commits, and uncommitted work. Use this context to suggest an
appropriate entry type and title.

## Determine Entry Details

Infer the following from the repository context:

1. **Entry type**
2. **Title**
3. **Description**
4. **Component**

## Create the Entry

First, Write the description to a temporary file, e.g., in /tmp.

Then create the entry:

```sh
uvx tenzir-changelog add \
  --title "<title>" \
  --type <type> \
  --description-file /tmp/changelog-description.md \
  --co-author claude \
  --component <component>
```

Omit `--description-file` if no description was provided.

Omit `--component` if not available or no suitable component is found.

## Verify

After creating the entry, show the result:

```sh
uvx tenzir-changelog show -c 1
```

Confirm the entry looks correct and inform the user where the file was created.

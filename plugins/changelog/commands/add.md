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

## Discover Available Components

Check `changelog/config.yaml` for a `components:` list. If a component clearly
fits the change, select one. If the change doesn't fit any component (e.g., CI
work, cross-cutting concerns), it's fine to omit.

## Determine Entry Details

Infer the following from the repository context:

1. **Entry type**
2. **Title**
3. **Description**
4. **Component** - If a component clearly fits the change, select one from the
   config. Omit if the change doesn't fit any component (e.g., CI, cross-cutting
   concerns).

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

Omit `--component` if the change doesn't clearly fit any defined component.

## Verify

After creating the entry, show the result:

```sh
uvx tenzir-changelog show --markdown 1
```

Confirm the entry looks correct and inform the user where the file was created.

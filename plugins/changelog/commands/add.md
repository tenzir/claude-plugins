---
description: Add a changelog entry for recent changes (feature, bugfix, breaking, change).
---

Make sure you loaded these skills:

- `changelog:managing-entries`
- `prose:technical-writing`

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

### Writing Style

Follow the `prose:technical-writing` skill. Additional guidance for changelog entries:

#### Titles

- **Plain text only** - No backticks, no markdown formatting. Titles appear in tables and feeds where markdown isn't rendered.
- **User-facing language** - Describe the user benefit, not the implementation. Good: "Autonomous documentation workflow", Bad: "New `docs:writer` subagent"
- **Descriptive noun phrases** - Describe what changed, not imperative commands. Good: "OAuth support for authentication API", Bad: "Add OAuth authentication"

#### Body

- **Standalone first sentence** - The first sentence must summarize the entire change, as compact mode only displays this
- **Write for users** - Explain what changed and why it matters, not implementation details
- **Use Markdown deliberately** - Frame code and technical terms in backticks (e.g., `--option 42`). Use _emphasis_ and **bold** where it improves clarity
- **Avoid PR-centric language** - Explain the change directly. Good: "The `--verbose` flag now shows detailed timing", Bad: "Adds detailed timing to the verbose flag"

## Create the Entry

First, write the description to a temporary file, e.g., in /tmp.

Then create the entry:

```sh
uvx tenzir-changelog --root <module>/changelog add \
  --title "<title>" \
  --type <type> \
  --description-file /tmp/changelog-description.md \
  --co-author claude
```

Omit `--root <module>/changelog` for standalone projects or when targeting the parent changelog.

Omit `--description-file` if no description was provided.

## Verify

After creating the entry, show the result:

```sh
uvx tenzir-changelog show --json 1
```

Confirm the entry data looks correct and inform the user where the file was created.

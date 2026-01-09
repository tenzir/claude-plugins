---
description: Add a changelog entry for recent changes (feature, bugfix, breaking, change).
context: fork
model: sonnet
argument-hint: "[breaking|feature|bugfix|change]"
---

Begin by invoking the `prose:technical-writing` skill and reading about the
`tenzir-ship` CLI here:

- <https://docs.tenzir.com/reference/changelog-framework.md>
- <https://docs.tenzir.com/guides/package-management/maintain-a-changelog.md>

Then guide us through adding a changelog entry for recent work.

## Gather Context

Review the full scope of changes to suggest an appropriate entry _type_ and
_title_ that captures the overall user-facing impact.

To this end, introspect the local git repository. A changelog entry typically
summarizes all changes in a PR and can go beyond a single commit.

If there is no PR, look at uncommitted changes and walk backwards in the git
history to determine a suitable sequence of commits that would make up a
coherent changelog entry. Always stop when you find a commit with an existing
changelog entry.

## Determine Target Changelog

For module-based projects (those with `modules:` in the project's
`changelog/config.yaml`):

1. Identify which module the change affects
2. Use `--root <module>/changelog` to target that module's changelog
3. For cross-cutting changes affecting multiple modules, use the parent changelog

For standalone projects, the default changelog directory is used.

## Determine Entry Details

Infer the following from the repository context:

1. **Entry type** (use `$1` if provided)
2. **Title**
3. **Description**

If entry type or title cannot be determined from context, abort and explain why.
Do not create placeholder entries.

### Writing Style

Follow the `prose:technical-writing` skill. Additional guidance for changelog entries:

#### Titles

- **Plain text only** since titles appear where Markdown isn't rendered
  - Sentence case
  - No backticks
  - No Markdown formatting
- **User-facing language** that describes the user benefit, not the implementation
  - Good: "Autonomous documentation workflow"
  - Bad: "New `docs:writer` subagent"
- **Descriptive noun phrases** that describe what changed, not imperative commands
  - Good: "OAuth support for authentication API"
  - Bad: "Add OAuth authentication"

#### Body

- **Standalone first sentence** that summarizes the _entire_ change
- **Write for users**
  - Explain what changed and why it matters, not implementation details
- **Use Markdown deliberately**
  - Frame code and technical terms in backticks (e.g., `--option 42`)
  - Use _emphasis_ and **bold** where it improves clarity
- **Avoid PR-centric language** to explain the change directly
  - Good: "The `--verbose` flag now shows detailed timing"
  - Bad: "Adds detailed timing to the verbose flag"

## Create the Entry

First, write the description to a temporary file, e.g., `.description.md`.
Thereafter create the entry:

```sh
uvx tenzir-ship --root <module>/changelog add \
  --title "<title>" \
  --type <type> \
  --description-file .description.md \
  --pr <number> \
  --co-author claude
```

Omit `--root <module>/changelog` for standalone projects or when targeting the
parent changelog.

Include `--pr <number>` only when running in GitHub Actions (CI). Extract the PR
number from `$GITHUB_EVENT_PATH`. Locally, omit `--pr` as it's auto-inferred
from `gh` context.

Remove the temporary description file on success.

## Summarize

After creating the entry, provide a summary to the user.

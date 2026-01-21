---
description: Write/update documentation for user-facing changes and new features
argument-hint: "[topic]"
hooks:
  PreToolUse:
    - matcher: "*"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/synchronize-docs.sh --init"
          once: true
    - matcher: "Read|Edit|Write|Glob|Grep"
      hooks:
        - type: command
          command: "$CLAUDE_PLUGIN_ROOT/scripts/synchronize-docs.sh"
---

# Write documentation

Invoke the `docs:authoring` skill for this sequence of steps.

## Important: Automatic synchronization

**Do not manually run git commands in `.docs/`**. The hooks handle everything:

1. First file operation clones the docs repo if missing
2. Subsequent operations check staleness (>24h triggers fetch)
3. Conflicts block with instructions to resolve

Simply use Read, Edit, Write, Glob, or Grep tools on `.docs/` files directly.

## 1. Determine what to document

- If the user provided a topic argument, use that as the documentation subject
- Otherwise, detect what to document by checking for uncommitted changes:
  - If there are uncommitted changes, analyze them to understand what was
    added/modified
  - If there are no uncommitted changes, tell the user to go backwards in the
    git history to find the last coherent set of commits they want documented

## 2. Determine target section

Apply the decision tree from the `docs:authoring` skill to select the right
section. Use `AskUserQuestion` if the appropriate section is ambiguous.

## 3. Check for existing documentation

Search `.docs/` for existing documentation on the topic:

- Check if a relevant page already exists
- If updating existing docs, read the current content first
- If creating new docs, check the directory structure for similar pages

## 4. Write the documentation

Create or update documentation files in `.docs/`:

- Add frontmatter with `title`
- Use `.mdx` format for new files
- Include code examples where relevant

## 5. Validate the documentation

Run linting in `.docs/` and auto-fix trivial issues. If there are remaining
linting errors, show them to the user and ask how to proceed.

## 6. Report results

Summarize what was done:

- List files created or modified
- Show the relative path within the docs

---
description: Write/update documentation for user-facing changes and new features
argument-hint: "[topic]"
args:
  topic:
    description: What to document (defaults to uncommitted changes or last commit)
    required: false
---

# Write documentation

Invoke the `docs:authoring` skill for this sequence of steps.

The `.docs/` directory is synchronized automatically via hook before file edits.

## 1. Determine what to document

If the user provided a topic argument, use that as the documentation subject.

Otherwise, detect what to document:

1. Run `git diff --stat` to check for uncommitted changes
2. If there are uncommitted changes, analyze them to understand what was
   added/modified
3. If there are no uncommitted changes, tell the user to go backwards in the git
   history to find the last coherent set of commits they want documented

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

Run linting and auto-fix trivial issues:

```bash
cd .docs && bun run lint:fix
```

If there are remaining linting errors, show them to the user and ask how to
proceed.

## 6. Report results

Summarize what was done:

- List files created or modified
- Show the relative path within the docs

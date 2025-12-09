---
description: Write documentation for code changes
args:
  topic:
    description: What to document (defaults to uncommitted changes or last commit)
    required: false
---

# Write documentation

## 1. Verify docs repository

Check if `.tenzir-docs/` exists in the project root.

If it does NOT exist, launch the `docs:manager` agent with `initialize` mode.
Wait for initialization to complete before proceeding. If initialization fails,
show the error and stop.

## 2. Determine what to document

If the user provided a topic argument, use that as the documentation subject.

Otherwise, detect what to document:

1. Run `git diff --stat` to check for uncommitted changes
2. If there are uncommitted changes, analyze them to understand what was
   added/modified
3. If there are no uncommitted changes, tell the user to go backwards in the git
   history to find the last coherent set of commits they want documented

## 3. Load the documentation skill

Load the `docs:writing-documentation` skill.

## 4. Determine target section

Apply the decision tree from the skill to select the right section. Use
`AskUserQuestion` if the appropriate section is ambiguous.

## 5. Check for existing documentation

Search `.tenzir-docs/` for existing documentation on the topic:

- Check if a relevant page already exists
- If updating existing docs, read the current content first
- If creating new docs, check the directory structure for similar pages

## 6. Write the documentation

Create or update documentation files in `.tenzir-docs/`:

- Add frontmatter with `title` and `description`
- Use `.mdx` format for new files
- Include code examples where relevant

## 7. Validate the documentation

Run linting and auto-fix trivial issues:

```bash
cd .tenzir-docs && pnpm lint:fix
```

If there are remaining linting errors, show them to the user and ask how to
proceed.

## 8. Report results

Summarize what was done:

- List files created or modified
- Show the relative path within the docs
- Suggest using `docs:manager` with `preview` mode to view the changes

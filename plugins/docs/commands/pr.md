---
description: Create a pull request (PR) for documentation changes
---

# Create documentation PR

At any step, if there are errors, report them and stop.

## 1. Detect documentation root

Run the detection script:

```bash
DOCS_ROOT=$($CLAUDE_PLUGIN_ROOT/scripts/detect-docs-root.sh)
```

## 2. Check for changes

Check for uncommitted changes in `$DOCS_ROOT`.

## 3. Lint

Run `pnpm lint:fix` in `$DOCS_ROOT`.

## 4. Build

Run `pnpm build:linkcheck` in `$DOCS_ROOT`.

## 5. Create PR

1. Create a topic branch (e.g., `topic/kafka-guide-updates`)
2. Stage and commit following `git:writing-commit-messages` conventions
3. Create PR with `gh pr create`
4. Report the PR URL

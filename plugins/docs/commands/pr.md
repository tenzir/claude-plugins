---
description: Create a pull request (PR) for documentation changes
---

# Create documentation PR

At any step, if there are errors, report them and stop.

## 1. Check for changes

Check for uncommitted changes in `.docs/`.

## 2. Lint

Run `pnpm lint:fix` in `.docs/`.

## 3. Build

Run `pnpm build:linkcheck` in `.docs/`.

## 4. Create PR

1. Create a topic branch (e.g., `topic/kafka-guide-updates`)
2. Stage and commit following `git:writing-commit-messages` conventions
3. Create PR with `gh pr create`
4. Report the PR URL

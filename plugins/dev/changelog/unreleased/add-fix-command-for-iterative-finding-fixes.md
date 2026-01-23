---
title: Add /fix command for iterative finding fixes
type: feature
authors:
  - mavam
  - claude
created: 2026-01-23T15:30:00.000000Z
---

New `/fix` command works through review findings one-by-one, creating a commit for each fix. For GitHub findings (GIT-\* IDs), it also replies to threads with the commit SHA and resolves them automatically.

Run `/review` first to generate findings, then `/fix` to fix them iteratively.

Related changes:

- The `/review` command step 6 now offers both `/fix` and plan mode options
- Both paths resolve GitHub threads after fixes are pushed

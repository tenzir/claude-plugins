---
title: Pre-commit linting step
type: change
authors:
  - mavam
  - claude
created: 2026-01-05T12:42:39.234359Z
---

The `/git:commit` command now includes a linting step before staging and
committing changes. If a project has a linter configured, it runs automatically
to catch issues early.

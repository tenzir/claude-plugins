---
title: Lint execution order in commit workflow
type: change
authors:
  - mavam
  - claude
created: 2026-01-08T20:34:58.387974Z
---

The commit workflow now runs linters before analyzing whether to split staged changes into multiple commits. This prevents wasted work from running linters on changes that may be split, ensuring each logical commit is linted individually.

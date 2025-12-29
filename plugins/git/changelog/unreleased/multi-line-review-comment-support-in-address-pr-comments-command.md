---
title: Multi-line review comment support in address-pr-comments command
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-29T13:54:21.23097Z
---

The `/git:address-pr-comments` command now handles multi-line review comments correctly. When a reviewer selects multiple lines while adding a comment, the command fetches the `startLine` field to determine the full range of the comment, from `startLine` to `line` (inclusive).

---
title: Add MDX file support to formatter hook
type: bugfix
authors:
  - mavam
  - claude
components:
  - formatter
created: 2025-12-08T14:34:55.234753Z
---

The format hook now formats `.mdx` files with markdownlint and prettier, preventing lint failures in projects that use MDX.

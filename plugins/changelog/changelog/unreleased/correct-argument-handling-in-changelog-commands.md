---
title: Correct argument handling in changelog commands
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-08T21:48:10.580637Z
---

The `/changelog:add` and `/changelog:release` commands now correctly use positional arguments (`$1`) instead of incorrectly referencing named arguments in their metadata.

Previously, both commands declared an `args` field in their frontmatter but then referenced the wrong variable names in their instructions. The `add` command referenced `type` argument instead of `$1`, and the `release` command referenced `bump` argument instead of `$1`. This caused the commands to fail when users provided arguments.

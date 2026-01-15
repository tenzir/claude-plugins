---
title: Stable clang-format version pinning
type: bugfix
authors:
  - lava
  - claude
pr: 7
created: 2026-01-15T18:18:33.297925Z
---

The formatting hook now uses `clang-format-21` instead of the generic `clang-format` command. This ensures consistent formatting behavior by pinning to the same version used in CI, since clang-format output varies across versions. If `clang-format-21` isn't available, the hook skips formatting rather than producing inconsistent results.

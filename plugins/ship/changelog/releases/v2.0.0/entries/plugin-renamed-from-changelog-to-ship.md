---
title: Plugin renamed from changelog to ship
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-09T16:59:24.87833Z
---

The `changelog` plugin has been renamed to `ship` to better reflect its focus on release engineering. Commands have been renamed from `/changelog:add` and `/changelog:release` to `/ship:add` and `/ship:release`. The `managing-entries` skill has been removed in favor of documentation links to the `tenzir-ship` CLI reference. All CLI invocations now use `tenzir-ship` instead of `tenzir-changelog`.

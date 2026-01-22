---
title: Dynamic documentation loading for tenzir plugin
type: feature
authors:
  - mavam
  - claude
created: 2026-01-22T19:19:50.926587Z
---

The `tenzir:docs` skill now dynamically loads documentation from the latest Tenzir GitHub release, ensuring you always have access to the most current information without waiting for plugin updates.

The sync process uses two complementary strategies. At session start, a background sync attempts to fetch the latest release tarball (`tenzir-skill.tar.gz`) with a 24-hour cache to avoid redundant downloads. If you use the skill and the cache has expired, a blocking sync ensures the documentation is up to date before the skill loads. This hybrid approach balances performance with freshness.

You can control sync behavior with the `--non-blocking` option for background downloads. The sync also patches the skill name to match the directory structure (`docs` instead of `tenzir`) and gracefully falls back to cached versions during network errors.

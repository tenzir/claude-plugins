---
title: Version synchronization validation in plugin validation script
type: change
authors:
  - mavam
  - claude
created: 2025-12-16T15:57:17.188575Z
---

The plugin validation script now enforces that the `version` field in each plugin's `plugin.json` matches the latest released version in its `changelog/releases/` directory. This validation catches mismatches between the declared plugin version and the actual released version, helping maintain consistency across the plugin marketplace.

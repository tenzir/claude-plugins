---
title: Add path detection to docs plugin
type: feature
authors:
- mavam
- Claude Code
components:
- docs
created: 2025-12-09T14:45:24.344912Z
---

The manager agent now auto-detects whether it's running directly in the `tenzir/docs` repository or needs to clone it to `.tenzir-docs/`. This enables seamless use of the plugin from within the docs repo itself.

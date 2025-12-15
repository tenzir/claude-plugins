---
title: Remove auto-update plugin
type: breaking
authors:
- mavam
- claude
created: 2025-12-15T08:49:46.896029Z
---

Remove the auto-update plugin as it was ineffective. The plugin ran on session start, but the current session already has old plugin code loaded, so updates only take effect on the next session. This made the automation pointless.

Users can manually run `claude plugin marketplace update tenzir` when they want to update the marketplace.

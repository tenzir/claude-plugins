---
title: Meta plugin removed from marketplace
type: breaking
authors:
  - mavam
  - claude
created: 2025-12-25T19:54:16.273907Z
---

The meta plugin provided guidance for managing plugins in this marketplace. Since it was self-referential and only useful within this repository, the `managing-plugins` skill has been moved to `~/.claude/skills/` for direct access.

Users who had `meta@tenzir` enabled should remove it from their settings. The validation script now detects stale plugin references in `.claude/settings.json` to prevent this issue in the future.

---
title: JSON-based hook communication and improved notifications
type: feature
authors:
  - mavam
  - claude
created: 2026-01-18T21:06:39.82682Z
---

The plan plugin hooks now communicate using structured JSON output instead of stderr messages, enabling better integration with Claude Code's hook system.

Key improvements include:

- All hooks output JSON with `systemMessage` fields that Claude can process in context
- New `PreToolUse` hook on `ExitPlanMode` notifies you when the plan review starts
- Cross-platform timeout support detects and uses `timeout` or `gtimeout` commands
- Fixed the `codex` command to use `codex exec --full-auto` for proper execution
- Improved tool list formatting with comma separation for readability
- All hooks now use `jq` for reliable JSON generation

These changes make plan reviews more transparent and integrate seamlessly with Claude's conversational context rather than appearing as separate stderr output.

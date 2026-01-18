---
title: Improved hook output handling and verdict detection
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-18T21:45:17.559593Z
---

The plan review hooks now handle tool output and verdict detection more reliably.

Changes to `review-plan.sh`:

- Separates stdout and stderr when running review tools to eliminate banner noise from tool output
- Passes prompts via stdin instead of command line arguments for cleaner process output
- Blocks on both `REVISE` and `BLOCK` verdicts, not just `BLOCK` alone
- Uses improved regex patterns with `\s*$` anchors to avoid matching template text in prompts
- Renamed `PLAN_REVIEW_BLOCK_ON_P1` to `PLAN_REVIEW_BLOCK` for consistency
- Formats review output with h1 headers instead of dash separators
- Adds immediate stderr notification when review starts

Changes to `notify-review-start.sh`:

- Documents PreToolUse hook limitations and forward compatibility approach
- Explains why systemMessage output is included despite current display limitations

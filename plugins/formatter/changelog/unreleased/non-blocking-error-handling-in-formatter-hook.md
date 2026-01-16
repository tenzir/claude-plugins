---
title: Non-blocking error handling in formatter hook
type: bugfix
authors:
  - mavam
  - claude
created: 2026-01-16T18:58:24.585592Z
---

The formatter hook no longer fails when formatters return non-zero exit codes, and missing formatters are now silently skipped.

Previously, the hook would print messages like "prettier not found, skipping auto-formatting" when a formatter wasn't installed, and could fail entirely when formatters returned errors (for example, when prettier encountered syntax errors). This caused hook failures that interrupted the editing workflow.

The hook now uses `|| true` to prevent non-zero exit codes from failing the hook, while still displaying any error messages from the formatters. If a formatter isn't installed, the hook silently continues without printing a warning.

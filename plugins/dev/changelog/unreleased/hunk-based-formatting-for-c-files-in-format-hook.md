---
title: Hunk-based formatting for C++ files in format hook
type: feature
authors:
  - mavam
  - claude
created: 2026-01-23T14:04:58.905553Z
---

The format hook now applies `clang-format` to only the changed hunks in staged C++ files rather than the entire file. This keeps your git history cleaner by preventing unrelated formatting changes from appearing in commits when only a few lines have been modified.

When you stage C++ file changes, the hook detects the modified line ranges using `git diff --cached` and passes them to `clang-format` via the `--lines` option. If no staged changes exist, the hook falls back to formatting the entire file. The implementation uses cross-platform compatible sed and bash features to work reliably on macOS and Linux.

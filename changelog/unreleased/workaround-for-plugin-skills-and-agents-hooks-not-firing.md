---
title: Workaround for plugin skills and agents hooks not firing
type: feature
authors:
  - mavam
  - claude
created: 2026-01-28T14:13:20.446191Z
---

Added a workaround for [Claude Code issue #17688](https://github.com/anthropics/claude-code/issues/17688) where frontmatter hooks in plugin skills and agents don't fire.

The `link-plugin-components.sh` script copies plugin components that have hooks defined in their frontmatter to the project's `.claude/` directory on session start. It uses `$CLAUDE_PLUGIN_ROOT` (set by Claude Code) to find the plugin, updates the `name:` field to include the plugin prefix, and resolves `$CLAUDE_PLUGIN_ROOT` paths to absolute paths in hook commands. The script skips files that already exist, so subsequent sessions are fast.

This workaround is triggered via a SessionStart hook. Currently affects the `dev:reviewing-changes` skill and `dev:docs-updater` agent.

This is a temporary workaround that should be removed once the upstream Claude Code bug is fixed.

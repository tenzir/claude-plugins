---
title: Git, plan, and formatter plugins merged into dev plugin
type: breaking
authors:
  - mavam
  - claude
created: 2026-01-22T18:04:19.732633Z
---

The git, plan, and formatter plugins have been consolidated into the dev plugin, creating a comprehensive developer utilities platform. This consolidation removes three separate plugins and unifies their capabilities within the dev plugin.

**Git workflows** are now part of dev:

- `@dev:committer` agent commits changes with automatic cohesion analysis to split orthogonal changes
- `@dev:pr-maker` agent creates pull requests on GitHub
- `dev:addressing-pr-comments` skill addresses PR review comments
- `dev:writing-commit-messages` skill guides cohesive commit messages

**Plan review** capabilities moved to dev:

- Plan review hooks (`review-plan.sh`, `notify-plan-review.sh`, `notify-review-start.sh`) now run as part of dev workflows
- Automated plan evaluation integrates with code review tools
- Review prompts and notifications are now scoped to the dev plugin

**Auto-formatting** workflows integrated:

- `format-hook.sh` and formatting logic now part of dev plugin
- Automatic formatting after Write and Edit operations
- Unified hook configuration for all dev-based operations

The consolidation maintains all existing functionality while providing a more cohesive experience for development workflows. Standalone projects and module-based projects continue to be supported.

---
title: Refactor managing-plugins skill with progressive disclosure
type: change
author: mavam
component: meta
created: 2025-12-09T00:00:00.000000Z
---

The managing-plugins skill now uses progressive disclosure with separate reference files for each plugin component type (skills, subagents, commands, hooks). The main SKILL.md links to these files, and Claude loads them as needed. Added guidance to use `@agent-claude-code-guide` for best practices.

---
title: Improved skill and agent descriptions with Use when pattern
type: change
authors:
  - mavam
  - claude
created: 2026-01-22T18:19:26.718889Z
---

Improved YAML frontmatter descriptions across agents, skills, and commands in the dev plugin to follow the "Use when" pattern for better automated model calling and discovery.

The descriptions now explicitly state the use cases and trigger conditions (file types, commands, actions, topics) that help Claude determine when to invoke each skill or agent. This structured format enhances automated discoverability while maintaining clear, user-focused language.

Examples of improvements:

- **Addressing PR comments skill**: Changed from "Address GitHub PR review comments with commits" to "Address review feedback in comments of a GitHub pull request (PR)" with expanded trigger conditions
- **All agents and skills**: Descriptions now consistently follow the "Use when" pattern with specific trigger examples like checking error messages, reviewing complexity, validating input, or writing guides

This change applies the patterns defined in the project guidelines to ensure consistent and machine-parseable discovery across the entire dev plugin ecosystem.

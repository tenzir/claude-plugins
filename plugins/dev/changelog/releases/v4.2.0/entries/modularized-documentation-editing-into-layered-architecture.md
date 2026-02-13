---
title: Modularized documentation editing into layered architecture
type: change
authors:
  - mavam
  - claude
created: 2026-01-31T09:53:43.700596Z
---

The `@dev:docs-updater` agent now uses a modular, layered architecture to separate concerns.

A new `dev:docs-editing` skill now handles the core workflow for creating and editing documentation, with five phases: determine scope, check existing docs, write docs, validate, and report results. The skill includes a `detect-change-scope.sh` hook that automatically injects change context at invocation.

A new `@dev:docs-editor` agent executes the `dev:docs-editing` skill and manages synchronization with the `.docs/` documentation repository. The agent leaves changes uncommitted for manual review or for the updater to handle.

The `@dev:docs-updater` agent is now an orchestrator that spawns `@dev:docs-editor` to perform edits, then spawns `@dev:pr-maker` to commit and create pull requests. It handles cross-linking PRs between the main repository and the documentation repository.

The skill layering now clearly separates concerns:

- `dev:docs-authoring` — what and where to create (structure, Diátaxis framework)
- `dev:technical-writing` — how to write (style, voice, clarity)
- `dev:docs-editing` — the process to follow (operational workflow, phases)

This modularization makes it easier to reuse skills independently and reason about documentation workflows.

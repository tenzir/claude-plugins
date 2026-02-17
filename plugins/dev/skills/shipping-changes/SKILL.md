---
name: shipping-changes
description: >-
  Ship changes through the PR lifecycle. Use when shipping changes,
  creating draft PRs, adding changelogs before merge, pushing
  finalized changes, or updating documentation.
---

# Shipping Changes

Ship code changes and update documentation in the right order. The skill
detects which mode to use based on the current branch and orchestrates the
appropriate agents.

## Shipping Workflow

### Main Mode

On the `main` branch (for simple, high-velocity projects that ship directly):

1. Spawn `@dev:changelog-adder` to add a changelog entry
2. Spawn `@dev:committer` to commit the change along with the changelog entry
3. Push to `main`

### Worktree Mode

On a topic branch (all changes go through PRs):

1. Spawn `@dev:committer` to commit the change
2. Spawn `@dev:pr-maker` to create a draft PR
3. Spawn `@dev:changelog-adder` to add a changelog entry
4. Spawn `@dev:committer` to commit the changelog entry
5. Push

## Updating Documentation

Most Tenzir repos have no project-internal documentation. Instead, they publish
to the unified documentation at docs.tenzir.com, backed by the open-source repo
`tenzir/docs`.

When changing user-facing functionality, all Tenzir repos clone the docs repo
at the top level into `.docs/`.

A typical documentation update:

1. Ensure `.docs/` is up to date: clone `tenzir/docs` if missing, otherwise
   fetch from origin
2. Create a topic branch in `.docs/` matching the parent repo's branch name
3. Spawn `@dev:docs-editor` to write or update the documentation
4. Spawn `@dev:pr-maker` in `.docs/` to open a PR against `tenzir/docs`
5. Cross-link PRs:
   - In the docs PR: add a "Related PRs" section linking the main PR
   - In the main PR: add a "Documentation PR" section linking the docs PR
6. Summarize what changed

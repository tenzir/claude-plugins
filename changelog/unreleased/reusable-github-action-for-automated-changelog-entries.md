---
title: Reusable GitHub Action for automated changelog entries
type: feature
authors:
  - mavam
  - claude
pr: 2
created: 2025-12-28T09:31:37.701365Z
---

A reusable GitHub Action enables automated changelog entry creation for pull requests. The action uses the `changelog:adder` agent to analyze PR changes, determine if they are user-facing, and create appropriate changelog entries.

The action is idempotent, skipping execution if an entry already exists for the PR. After creating an entry, it posts a formatted comment to the PR with metadata and sync instructions for both Git and Jujutsu workflows.

Other repositories can integrate this action into their CI workflows by referencing `tenzir/claude-plugins/.github/actions/changelog-adder@main` and providing a Claude Code OAuth token.

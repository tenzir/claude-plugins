---
title: Non-interactive changelog entry creation for CI automation
type: feature
authors:
  - mavam
  - claude
pr: 1
created: 2025-12-23T18:12:45Z
---

The `changelog:adder` agent enables non-interactive changelog entry creation for CI automation. When users comment `@claude add a changelog entry` on a PR with the Claude GitHub App installed, Claude automatically analyzes the PR and creates an appropriate changelog entry.

The agent autonomously determines the entry type, title, and description based on PR context, making it ideal for automated workflows.

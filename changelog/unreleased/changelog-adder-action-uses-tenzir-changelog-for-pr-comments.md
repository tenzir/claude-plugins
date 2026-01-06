---
title: Changelog-adder action uses tenzir-changelog for PR comments
type: change
authors:
  - mavam
  - claude
pr: 4
created: 2026-01-06T11:23:50.93385Z
---

The changelog-adder GitHub Action now uses `tenzir-changelog` to render PR
comments instead of manual frontmatter parsing. This fixes two formatting
issues: a trailing separator when the `created` field is missing, and
hard-wrapped body text that rendered with explicit line breaks.

The action also supports multiple changelog entries per PR. When a PR adds
entries across several plugins, all entries appear in a single comment with
proper headings and attribution links.

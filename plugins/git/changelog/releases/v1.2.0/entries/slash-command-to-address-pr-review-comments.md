---
title: Slash command to address PR review comments
type: feature
authors:
  - mavam
  - claude
created: 2025-12-29T08:53:43.754533Z
---

The new `/git:address-pr-comments` command works through GitHub PR review comments systematically. It creates one commit per comment (or group of related comments), replies with the commit SHA, and resolves threads automatically.

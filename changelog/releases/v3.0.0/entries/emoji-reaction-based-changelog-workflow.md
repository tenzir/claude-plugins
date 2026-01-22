---
title: Emoji reaction-based changelog workflow
type: feature
authors:
  - mavam
  - claude
pr: 8
created: 2026-01-15T21:20:37.85905Z
---

Changelog entries are now generated as suggestions in PR comments rather than automatically committed. You can approve, reject, or modify suggestions using GitHub emoji reactions.

React with 👍 to accept and commit the entry, 👎 to reject when no changelog is needed, or 😕 to regenerate with different content. Additional reactions let you adjust the style: 🚀 makes entries more technical, 👀 makes them simpler, and 😄 adds more wit.

The workflow polls reactions every minute and automatically applies your choice. This gives you control over changelog content before it's committed to your PR.

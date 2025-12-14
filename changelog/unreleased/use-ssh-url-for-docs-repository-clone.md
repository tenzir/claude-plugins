---
title: Use SSH URL for docs repository clone
type: change
authors:
- mavam
- claude
components:
- docs
created: 2025-12-14T10:14:21.321454Z
---

The `/docs:write-docs` command now clones the documentation repository using SSH
(`git@github.com:tenzir/docs.git`) instead of HTTPS. This enables seamless
authentication for users with SSH keys configured, avoiding credential prompts.

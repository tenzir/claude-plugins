---
title: Improved release workflow with project type detection and local temp files
type: bugfix
authors:
  - mavam
  - claude
created: 2025-12-23T07:37:15.619246Z
---

The release command now uses a `detect-project-type.sh` script to identify project types (python, rust, node, cpp) and conditionally executes project-specific sections using `<project type="...">` XML tags.

Temporary files moved from `/tmp` to local dotfiles (`.changelog-description.md`, `.intro.md`) with explicit cleanup instructions after successful operations. This avoids `Write` tool errors when writing outside the project sandbox.

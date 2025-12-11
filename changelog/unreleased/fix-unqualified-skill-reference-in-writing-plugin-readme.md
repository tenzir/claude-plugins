---
title: Fix unqualified skill reference in writing plugin README
type: bugfix
authors:
- mavam
- claude
components:
- writing
created: 2025-12-11T12:07:35.927857Z
---

Fix unqualified skill reference in documentation.

The README incorrectly referenced `technical-writing` without the plugin namespace. Updated to use the fully qualified name `writing:technical-writing` for consistency with skill naming conventions.

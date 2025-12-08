---
title: Prompt for orthogonal staged changes
type: feature
authors:
- mavam
- claude
components:
- git
created: 2025-12-08T14:55:37.659765Z
---

The `/commit` command now analyzes staged changes for cohesion. When multiple orthogonal changes are detected, it presents a selection prompt to choose which change to commit first, helping maintain atomic commits.

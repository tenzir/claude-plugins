---
title: Rename /python:python-release to /python:release
type: breaking
author: mavam
component: python
created: 2025-12-05T07:23:51.267263Z
---

The release command is now invoked as `/python:release` instead of the redundant `/python:python-release`, since the plugin namespace already provides the `python:` prefix.

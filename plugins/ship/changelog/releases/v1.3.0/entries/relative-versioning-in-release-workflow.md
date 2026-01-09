---
title: Relative versioning in release workflow
type: change
authors:
  - mavam
  - claude
created: 2025-12-21T10:52:26.715403Z
---

The release workflow now uses `--patch`, `--minor`, or `--major` flags instead
of explicit version numbers. The new `release version` command queries the
latest version for commit messages, and `release publish` defaults to the
latest release when no version is specified.

---
title: Remote release workflow detection
type: feature
authors:
  - mavam
  - claude
created: 2026-02-13T10:17:49.479428Z
---

The `/dev:release` command now detects and uses remote release workflows. When your repository has a release workflow (such as `.github/workflows/release.yaml`), the command automatically triggers it using `gh workflow run` instead of performing a local release. This enables centralized, consistent release processes managed through GitHub Actions.

If your repository doesn't have a remote workflow, the command falls back to the existing local release process. Module releases continue using their local steps, since the parent project handles publishing.

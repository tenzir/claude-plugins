---
title: Document extension.toml for version bumping
type: change
authors:
  - mavam
  - claude
created: 2025-12-19T07:57:33.864229Z
---

Updated the release command documentation to include `extension.toml` in the list of version files to check during the version bump step. This ensures users are aware that Rust extension projects should update their `extension.toml` version alongside other version files like `Cargo.toml` and `plugin.json`.

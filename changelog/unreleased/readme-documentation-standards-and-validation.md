---
title: README documentation standards and validation
type: change
authors:
  - mavam
  - claude
created: 2025-12-29T15:56:36.068231Z
---

Plugin READMEs now follow stricter documentation standards with validation.

The documentation script extracts title, description, features, and usage
sections from READMEs. New requirements ensure consistency:

- **Intro paragraph**: 2-3 sentences after the title, kept up to date when
  plugins change
- **Features section**: Required with emoji-prefixed bullet points highlighting
  what the plugin provides
- **Usage section**: Required with real-world examples showing how to use each
  component
- **Heading style**: Standardized on `## ✨ Features` and `## 🚀 Usage`

The validation script now enforces these requirements, catching missing
sections and incorrect heading styles. This is important because the
documentation at [docs.tenzir.com](https://docs.tenzir.com) relies on this
structure.

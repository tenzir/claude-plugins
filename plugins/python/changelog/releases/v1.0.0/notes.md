This major release standardizes skill naming with `python:following-conventions` and replaces the plugin-specific release command with the generic `/changelog:release` command. It also adds a dependency upgrade guide for Python projects.

## 💥 Breaking changes

### Rename `python-conventions` skill to `following-conventions`

The skill name follows the pattern `<language>:following-conventions`, allowing consistent naming across future language plugins (e.g., `rust:following-conventions`, `go:following-conventions`).

*By @mavam and @claude.*

### Replace `/python:release` with `/changelog:release`

The `/python:release` command has been removed. Use `/changelog:release` instead, which auto-detects Python projects and applies the appropriate quality gates and version bumping.

*By @mavam and @claude.*

## 🚀 Features

### Add dependency upgrade guide for Python plugin

New reference document specifies the `uv lock --upgrade` command and canonical commit message for dependency upgrades.

*By @mavam and @claude.*

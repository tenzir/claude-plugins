This major release standardizes skill naming with `python:following-conventions` and replaces the plugin-specific release command with the generic `/changelog:release` command. It also adds a dependency upgrade guide for Python projects.

## 🚀 Features

### Add /commit slash command

The new `/commit` command guides through project-specific commit workflows, checking CLAUDE.md for requirements like changelog entries and version bumps.

*By @mavam.*

### Add committer subagent

The new `committer` subagent is a lightweight Haiku-based agent that handles the commit workflow autonomously by executing the `/git:commit` slash command internally.

*By @mavam.*

### Prompt for orthogonal staged changes

The `/commit` command now analyzes staged changes for cohesion. When multiple orthogonal changes are detected, it presents a selection prompt to choose which change to commit first, helping maintain atomic commits.

*By @mavam and @claude.*

## 🔧 Changes

### Reference changelog skill in /commit command

The `/commit` command now instructs Claude to load the `changelog:changelog-management` skill when working with projects that maintain a changelog.

*By @mavam and @claude.*

## 🐞 Bug fixes

### Fix unqualified skill reference in git plugin README

Fix unqualified skill reference in documentation.

The README incorrectly referenced `git:committer` without the plugin namespace. Updated to use the fully qualified name `git:committer` for consistency with skill naming conventions.

*By @mavam and @claude.*

### Improve skill trigger for commit requests

The skill now triggers when users ask to commit changes, not just when running `git commit` or asking about commit message format.

*By @mavam.*

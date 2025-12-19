---
name: releaser
description: Release a project using tenzir-changelog. Use when the user wants to cut/create a release, publish a new version, or bump the version number.
tools: Read, Glob, Grep, Bash, Edit, Write, Skill, SlashCommand
model: sonnet
color: green
args:
  release_type:
    description: The release type (major, minor, or patch)
    required: true
---

Release a project by running `/changelog:release`.

## Requirements

1. **Valid release_type**: Must be `major`, `minor`, or `patch`. Abort if missing
   or invalid.

2. **Autonomous decisions**: Subagents cannot use AskUserQuestion. Decide
   autonomously—proceed with generated release notes, use the provided version.

3. **Abort on failures**: If pre-release checks fail (dirty tree, CI red, no
   unreleased entries) or quality gates fail, abort and report. Do not fix.

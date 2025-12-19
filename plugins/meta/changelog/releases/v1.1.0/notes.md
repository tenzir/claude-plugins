# Composability Principle for Subagents

This release introduces autonomous documentation workflows with the new `/docs:review` command and `docs:writer` subagent. The plugin now uses `.docs` as the unconditional documentation root and streamlines command naming by renaming `/docs:write-docs` to `/docs:write`.

## 🔧 Changes

### Document composability principle for subagents

Documented composability principle for subagents and slash commands. Clarified that subagents should invoke slash commands and add only orthogonal concerns (argument validation, autonomous decisions, error handling) rather than duplicating the command's workflow logic. Added a table distinguishing responsibilities between slash commands and subagents, with examples of good vs bad patterns.

*By @mavam and @claude.*

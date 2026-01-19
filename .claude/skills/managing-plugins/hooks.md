# Hooks

Learn more: <https://code.claude.com/docs/en/hooks.md>

## Design Principles

**Prefer hooks over embedded commands.** When a command or skill needs to execute
shell commands, move that execution to a hook script rather than embedding the
command in the prompt. This keeps prompts focused on instructions while hooks
handle execution reliably.

**Output everything the model needs.** Hooks should output all computed values
(paths, commands, IDs) so the model doesn't need to run shell commands to figure
them out. If a model would need to run `date`, `echo $VAR`, or similar commands
to construct a value, the hook should output that value instead.

Examples:

- Instead of instructing "run `git diff --cached`", output the diff command
- Instead of expecting the model to construct a path, output the full path

## Script Guidelines

- Use portable shebang: `#!/usr/bin/env bash`
- Exit codes:
  - `0` — success; stdout shown in verbose mode (or added to context for some hooks)
  - `2` — blocking error; stderr fed back to Claude as error message
  - Other — non-blocking error; stderr shown in verbose mode
- Output:
  - stdout — informational output (can be JSON for structured control)
  - stderr — error messages shown to Claude (on exit code 2)
- Environment variables:
  - `CLAUDE_PROJECT_DIR` — project root directory
  - `CLAUDE_PLUGIN_ROOT` — plugin directory (for plugin hooks)
- Default timeout: 60 seconds (configurable per hook)
- Input: JSON via stdin with session info and event-specific data

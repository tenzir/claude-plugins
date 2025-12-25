# Subagents

Subagents invoke slash commands. They add only orthogonal concerns—never
duplicate the command's workflow.

## Composability Principle

| Component         | Responsibility                                           |
| ----------------- | -------------------------------------------------------- |
| **Slash command** | Complete workflow logic (steps, order, domain knowledge) |
| **Subagent**      | Invocation + orthogonal concerns only                    |

Orthogonal concerns:

- **Argument validation**: Check required args before invoking
- **Autonomous decisions**: Policy for choices (subagents can't ask questions)
- **Error handling**: Abort vs retry vs fix policy

## Example

Good (orthogonal only):

```markdown
Release a project by running `/changelog:release`.

## Requirements

1. **Valid release_type**: Must be `major`, `minor`, or `patch`. Abort if invalid.
2. **Autonomous decisions**: Proceed with generated notes, use provided version.
3. **Abort on failures**: Report and stop. Do not fix.
```

Bad (duplicates workflow):

```markdown
## Release Steps

1. Run pre-release checks
2. Determine version
3. Stage the release
   ...
```

## Limitations

- Subagents **cannot** use `AskUserQuestion`—they must decide autonomously
- Design clear defaults for any choices the command might present

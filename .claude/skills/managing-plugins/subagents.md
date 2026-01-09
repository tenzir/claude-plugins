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
Release a project by running `/ship:release`.

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

## Skills

Subagents don't inherit skills from the parent conversation. If a subagent or
any slash command it invokes uses a skill, you must declare it in the `skills:`
frontmatter field:

```yaml
---
name: writer
skills: docs:authoring, prose:technical-writing, git:writing-commit-messages
---
```

Trace the full call chain to identify all required skills. For example, if a
subagent invokes `/docs:pr`, which invokes `/git:pr`, which invokes
`/git:commit`, which uses the `git:writing-commit-messages` skill—that skill
must be declared in the subagent's frontmatter.

The validation script checks that all skill references exist.

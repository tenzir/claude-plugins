# Claude Code Plugins for Tenzir

This is a Claude Code plugin marketplace.

## Plugin Structure

Every plugin lives in `plugins/<plugin-name>/` with this structure:

```
plugins/<plugin-name>/
├── .claude-plugin/
│   └── plugin.json    # Plugin metadata and configuration
├── changelog/         # Plugin changelog
├── README.md          # User-facing documentation (required)
├── skills/            # Skill definitions
├── commands/          # Slash commands
├── hooks/             # Hook scripts and configuration
└── agents/            # Subagent definitions
```

## Naming Conventions

Always prefix skills, slash commands, and agents with their plugin name:

- Skills: `dev:writing-commit-messages`, `brand:styling-tenzir-ui`
- Commands: `/dev:review`, `/dev:finalize`
- Agents: `@dev:fixer`, `@dev:changelog-adder`

Use this format in documentation, changelog entries, and code references.

## Skills

Consult the [the Claude Skill docs](https://code.claude.com/docs/en/skills.md)
for the authoritative reference on skill structure and best practices.

### Naming

Use gerund form (verb + -ing): `writing-commit-messages`, `managing-changelogs`

### Descriptions

Use the "Use when" pattern for discovery:

```yaml
description: <What the skill does>. Use when <trigger1>, <trigger2>, or <trigger3>.
```

Good triggers: file types, commands, actions, topics.

### Referencing Skills from Agents

Use array notation for the `skills:` frontmatter field in agents:

```yaml
skills:
  - dev:writing-commit-messages
  - dev:addressing-reviews
```

## Slash Commands

Prefer skills over slash commands.

## Hooks

Learn more: <https://code.claude.com/docs/en/hooks.md>

Prefer JSON output with `additionalContext` to inject data into Claude's
context:

```bash
jq -n \
  --arg hookEventName "PreToolUse" \
  --arg additionalContext "Your context here" \
  '{hookSpecificOutput: $ARGS.named}'
```

## Workflows

### Adding a Plugin

1. Create `plugins/<plugin-name>/` with the structure above
2. Register in `.claude-plugin/marketplace.json`:

   ```json
   {
     "name": "plugin-name",
     "description": "What this plugin does",
     "source": "./plugins/plugin-name"
   }
   ```

   Keep plugins sorted alphabetically. The `description` must be duplicated in
   both `plugin.json` and `marketplace.json`—the marketplace needs its own copy.

3. Update the plugin table in `README.md`
4. Run validation: `scripts/validate-plugins.sh`

### Updating a Plugin

1. Make your changes
2. Keep the README description up to date when the plugin changes
3. Add changelog entry: spawn `@dev:changelog-adder`

### Renaming or Removing a Plugin

1. Update or remove the entry in `.claude-plugin/marketplace.json`
2. Update the plugin table in `README.md`
3. Rename or remove the `plugins/<plugin-name>/` directory

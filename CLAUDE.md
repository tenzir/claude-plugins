# Claude Code Plugins for Tenzir

This repository is a Claude Code plugin marketplace named `tenzir`. It contains
plugins that extend Claude's capabilities for working with the Tenzir ecosystem.

## Repository Structure

All plugins live in the `plugins/` subdirectory. The marketplace manifest
registers all available plugins.

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json   # Marketplace manifest (MUST stay in sync)
├── plugins/
│   ├── my-plugin/         # A plugin
│   ├── another-plugin/    # Another plugin
│   └── ...
└── ...
```

## Adding a Plugin

Create a new directory in `plugins/`. Then update
`.claude-plugin/marketplace.json` to register it:

```json
{
  "plugins": [
    {
      "name": "plugin-name",
      "description": "What this plugin does",
      "source": "./plugins/<plugin-name>"
    }
  ]
}
```

## Marketplace Manifest

The `.claude-plugin/marketplace.json` file defines this marketplace. It must
always reflect the current state of the `plugins/` directory. Each entry in the
`plugins` array should correspond to an actual plugin directory. Keep the
plugins sorted alphabetically by name.

## Plugin README Template

Every plugin should have a `README.md` following this structure **exactly**:

```markdown
# Plugin Name

Brief one-liner description of what the plugin does.

## ✨ Features

Explain the motivation. If this is a workaround for a missing feature, link to
the relevant issue and note when it will become obsolete.

- 🦄 **Highlight 1**: Describe the highlight here
- 🖤 **Highlight 2**: Describe the highlight here
- 🏆 **Highlight 3**: Describe the highlight here

## 📦 Installation

\`\`\`
/plugin install <plugin-name>@tenzir
\`\`\`

## 🔧 Configuration

Optional section. Document any configuration options if applicable.

## ⚙️ How it works

Describe the plugin's behavior in detail. Include:

- When it triggers (e.g., on edit, on session start)
- What actions it performs
- Any side effects or dependencies
```

## Skills

Read the [skill best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices.md)
for general guidance.

### Naming

Use gerund form (verb + -ing) with lowercase letters, numbers, and hyphens:

- `writing-commit-messages` (not `commit-message-writing`)
- `managing-changelogs` (not `changelog`)

### Structure

- Keep `SKILL.md` under 500 lines
- Link to reference files for details, but keep references one level deep
- Every paragraph must justify its token cost

### Descriptions

Descriptions must be specific to enable discovery. Use the "Use when" pattern:

```yaml
description: <What the skill does>. Use when <trigger1>, <trigger2>, or <trigger3>.
```

Good triggers include:

- File types: `.py` files, `pyproject.toml`, `changelog/unreleased/`
- Commands: `git commit`, `uvx tenzir-changelog`, `ruff check`
- Actions: editing, reviewing, setting up, running
- Topics: type hints, commit format, release notes

Example:

```yaml
description: Write and review Python code. Use when editing .py files, running ruff/mypy/pytest, or asking about type hints.
```

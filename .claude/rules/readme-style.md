---
paths: "**/README.md"
---

Plugin READMEs describe **usage**, not implementation.

## Template

Every plugin **must** have a `README.md` with the following structure:

```markdown
# Plugin Name

Two to three sentences describing what the plugin does and why it exists. This
introductory paragraph appears in the documentation, so keep it informative and
up to date whenever the plugin changes.

## ✨ Features

Explain the motivation. If this is a workaround for a missing feature, link to
the relevant issue and note when it will become obsolete.

- 🦄 **Highlight 1**: Describe the highlight here
- 🖤 **Highlight 2**: Describe the highlight here
- 🏆 **Highlight 3**: Describe the highlight here

## 🔧 Configuration

Optional section. Document any configuration options if applicable.

## 🚀 Usage

Focus on **how to use** the plugin, not implementation details. For each
component:

- **Commands**: Show invocation (`/plugin:command`) and describe _what it does
  for the user_, not internal steps
- **Skills**: Explain _when_ they activate and _what guidance_ they provide
- **Subagents**: Describe _when to use them_ and _what they accomplish_
```

## Documentation Script Requirements

The docs script extracts these sections from README files:

1. **Title**: First `#` heading in the file
   - Used as plugin display name (e.g., "OCSF", "TQL", "C++")
   - Falls back to capitalized plugin directory name if missing

2. **Description**: First paragraph after the `#` heading
   - Must be separated from heading by a blank line
   - Should be 2-3 sentences ending with `.`, `!`, or `?`
   - No fallback—will be empty if missing

3. **Features section**: `## ✨ Features` (required)
   - Bullet-point highlights of what the plugin provides
   - Each bullet must start with an emoji (e.g., `- 📝 **Feature**:`)
   - Content extracted until next `##` heading

4. **Usage section**: `## 🚀 Usage` (required)
   - Examples showing how to use each component
   - Content extracted until next `##` heading

The script ignores `## Installation` (generates its own) and `plugin.json`
description field. Section ordering does not matter.

## Writing Guidelines

- Show how to invoke commands, when skills activate, when to use subagents
- Describe outcomes and benefits, not internal steps
- Keep descriptions concise—one or two sentences per component

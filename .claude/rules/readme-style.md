---
paths: "**/README.md"
---

Plugin READMEs describe **usage**, not implementation.

## Documentation Script Requirements

The docs script extracts these sections from README files:

1. **Title**: First `#` heading in the file
   - Used as plugin display name (e.g., "OCSF", "TQL", "C++")
   - Falls back to capitalized plugin directory name if missing

2. **Description**: First paragraph after the `#` heading
   - Must be separated from heading by a blank line
   - Should be 2-3 sentences ending with `.`, `!`, or `?`
   - No fallback—will be empty if missing
   - **Keep this up to date when the plugin changes**

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

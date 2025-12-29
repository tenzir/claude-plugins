# OCSF

Understand the OCSF schema structure.

## ✨ Features

- 📚 **Schema Navigation**: Hierarchical reference to event classes, objects,
  and profiles across OCSF versions
- 🧩 **Core Concepts**: Learn attributes, objects, classes, profiles, and
  extensions
- 🔄 **Versioned References**: Auto-generated documentation for each OCSF
  release
- 🤖 **Guide Subagent**: Fast answers to OCSF schema questions

## 📦 Installation

```
/plugin install ocsf@tenzir
```

## 🚀 Usage

### `ocsf:guide` subagent

Ask questions about OCSF classes, objects, attributes, or profiles. Uses the
skill to provide accurate, version-aware answers.

### `ocsf:understanding-ocsf` skill

Activates when working with OCSF schema elements. Provides:

- Attribute types and naming conventions
- Class reference organized by category
- Object reference with cross-links
- Profile and extension documentation

## 🔧 Reference Generation

Reference documentation is fetched from schema.ocsf.io. To regenerate:

```bash
# Generate for latest version
uv run plugins/ocsf/scripts/generate-references.py

# Generate for all stable versions
uv run plugins/ocsf/scripts/generate-references.py --all
```

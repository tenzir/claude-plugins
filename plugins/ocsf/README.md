# OCSF

Understand the OCSF schema structure.

## Features

- **Schema Navigation**: Hierarchical reference to 83 event classes and 170
  object types
- **Core Concepts**: Learn attributes, objects, classes, profiles, and
  extensions
- **Category Organization**: Classes organized by 8 OCSF categories

## Installation

```
/plugin install ocsf@tenzir
```

## Usage

### `ocsf:understanding-ocsf` skill

Activates when introspecting OCSF schema elements. Provides:

- Overview of 5 core OCSF concepts
- Attribute types and naming conventions
- Class reference organized by category
- Object reference with cross-links
- Profile and extension documentation

## Reference Generation

Reference documentation is fetched from schema.ocsf.io and cached locally. A
`SessionStart` hook generates references automatically on first use.

To regenerate manually:

```bash
uv run plugins/ocsf/scripts/generate-references.py --all
```

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

## Generating References

Reference documentation is fetched from schema.ocsf.io and not checked into git.
Run the generator after installation:

```bash
# Generate for a specific version
python3 plugins/ocsf/scripts/generate-references.py --version 1.7.0

# Generate for all stable versions (1.0.0 through 1.7.0)
python3 plugins/ocsf/scripts/generate-references.py --all
```

References are organized by version: `references/<version>/classes/` and
`references/<version>/objects/`.

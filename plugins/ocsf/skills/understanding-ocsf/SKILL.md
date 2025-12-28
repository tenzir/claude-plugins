---
name: understanding-ocsf
description: Understand the OCSF schema. Use when working with OCSF, looking up
  classes or objects, normalizing security events, or asking about the schema.
---

# Understanding OCSF

The Open Cybersecurity Schema Framework (OCSF) is a vendor-agnostic schema for
normalizing security telemetry. This skill helps you understand its structure.

## Core Concepts

OCSF organizes cybersecurity data through five interconnected constructs:

1. **Attributes** - Named data types (scalar or complex) that form the
   foundation. See [attributes.md](./attributes.md).

2. **Objects** - Collections of contextually related attributes representing
   entities like Process, User, or File. See [objects.md](./objects.md).

3. **Classes** - Structured sets of attributes and objects describing specific
   security events like authentication or file activity.
   See [classes.md](./classes.md).

4. **Profiles** - Dynamic mix-ins that augment classes with cross-cutting
   attributes (e.g., Cloud, Container, Host). See [profiles.md](./profiles.md).

5. **Extensions** - Mechanisms for expanding the schema without modifying the
   core. See [extensions.md](./extensions.md).

## Hierarchy

```
Attributes  →  Objects  →  Event Classes  →  Categories
   │              │              │               │
   └──────────────┴──────────────┴───────────────┘
                  compose into
```

- **Attributes** populate **Objects**
- **Objects** populate **Event Classes**
- **Event Classes** are organized into **Categories**
- **Profiles** cross-cut multiple Event Classes
- **Extensions** can add new elements at any level

## Categories

OCSF organizes event classes into 8 categories:

| Category    | UID  | Use When                                    |
| ----------- | ---- | ------------------------------------------- |
| System      | 1xxx | OS/endpoint events (files, processes)       |
| Findings    | 2xxx | Security detections and alerts              |
| IAM         | 3xxx | Identity and access (auth, account changes) |
| Network     | 4xxx | Network communication (connections, DNS)    |
| Discovery   | 5xxx | Asset/config state (inventory, software)    |
| Application | 6xxx | Application behavior (API, datastore)       |
| Remediation | 7xxx | Incident response activities                |
| Unmanned    | 8xxx | Unmanned systems (experimental)             |

## Quick Reference

- [Attributes](./attributes.md) - Types, naming conventions
- [Objects](./objects.md) - Reusable entity structures
- [Classes](./classes.md) - Event schemas by category
- [Profiles](./profiles.md) - Cross-cutting augmentations
- [Extensions](./extensions.md) - Schema expansion

## Version-specific References

Detailed per-class and per-object references: [references/](./references/index.md)

References are generated from schema.ocsf.io and not checked into git.
**If missing**, run the generator first:

```bash
python3 plugins/ocsf/scripts/generate-references.py --all
```

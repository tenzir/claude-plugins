# OCSF

Reference documentation for the Open Cybersecurity Schema Framework (OCSF).
Provides hierarchical navigation of event classes, objects, attributes, and
profiles across OCSF versions.

## ✨ Features

- 🗂️ **Schema Navigation**: Hierarchical reference to event classes, objects,
  and profiles across OCSF versions
- 📚 **Core Concepts**: Learn attributes, objects, classes, profiles, and
  extensions
- 📖 **Versioned References**: Auto-generated documentation for each OCSF release
- 🤖 **Guide Subagent**: Fast answers to OCSF schema questions

## 🚀 Usage

### `ocsf:guide` subagent

Delegate OCSF questions to the guide for fast, accurate answers:

```
@ocsf:guide What class should I use for SSH login events?

@ocsf:guide What's the difference between actor and user objects?

@ocsf:guide Which profile adds container context to events?
```

### `ocsf:understanding-ocsf` skill

Activates automatically when you work with OCSF. Example prompts:

```
Normalize this Sysmon process creation event to OCSF

What attributes are required for Authentication (3002)?

Map this firewall log to the appropriate OCSF class

How do I represent a failed MFA attempt in OCSF?
```

The skill loads class references, object definitions, and profile documentation
to help you build spec-compliant events.

## Reference Generation

Reference documentation is fetched from schema.ocsf.io. To regenerate:

```bash
# Generate for latest version
uv run plugins/ocsf/scripts/generate-references.py

# Generate for all stable versions
uv run plugins/ocsf/scripts/generate-references.py --all
```

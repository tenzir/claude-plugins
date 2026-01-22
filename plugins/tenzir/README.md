# Tenzir

Build TQL pipelines and OCSF mappings with expert guidance. Provides workflow
skills for creating parser packages and OCSF mappings, plus an OCSF subagent
for schema navigation.

## ✨ Features

- **Documentation Access**: Complete Tenzir documentation available as a skill,
  auto-synced from the latest release
- **Parser Creation**: Guided workflow for building parsing pipelines from
  raw log data with iterative testing
- **OCSF Mapping**: Transform parsed events into OCSF-compliant format with
  validation
- **OCSF Schema Navigation**: Fast answers to OCSF schema questions via the
  `tenzir:ocsf` subagent

## 🚀 Usage

### `tenzir:docs` skill

Provides the complete Tenzir documentation as context. The documentation is
automatically downloaded from the latest GitHub release and cached locally.
Syncs every 24 hours to stay current.

The skill covers deployment, configuration, TQL (Tenzir Query Language),
operators, functions, formats, connectors, integrations, and the Tenzir
Platform.

### `/tenzir:make-parser` skill

Guided workflow for creating a TQL parsing pipeline package from sample log
data. Walks through 5 phases: input analysis, package scaffolding, iterative
testing, sample synthesis, and summarization.

**Usage:**

```
/tenzir:make-parser
```

Then provide sample log data when prompted.

### `/tenzir:make-ocsf-mapping` skill

Adds OCSF (Open Cybersecurity Schema Framework) mapping to an existing parser
package. If no parser exists, it will invoke `/tenzir:make-parser` first.

**Usage:**

```
/tenzir:make-ocsf-mapping
```

Then provide the package directory or sample log data when prompted.

### `tenzir:ocsf` subagent

Delegate OCSF questions for fast, accurate answers:

```
@tenzir:ocsf What class should I use for SSH login events?

@tenzir:ocsf What's the difference between actor and user objects?

@tenzir:ocsf Which profile adds container context to events?
```

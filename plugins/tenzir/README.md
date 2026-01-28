# Tenzir

Build TQL pipelines and OCSF mappings with expert guidance. Provides workflow
skills for creating parser packages and OCSF mappings, plus subagents for
documentation lookup and OCSF schema navigation.

## ✨ Features

- **Documentation Access**: Complete Tenzir documentation available as a skill,
  auto-synced from the latest release
- **Parser Creation**: Guided workflow for building parsing pipelines from
  raw log data with iterative testing
- **OCSF Mapping**: Transform parsed events into OCSF-compliant format with
  validation
- **Documentation Guide**: Fast answers to Tenzir questions via the
  `tenzir:guide` subagent
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

### `/tenzir:managing-packages` skill

Guided workflow for creating a TQL parsing pipeline package from sample log
data. Walks through 4 phases: input analysis, package scaffolding, iterative
testing, and summarization.

**Usage:**

```
/tenzir:managing-packages
```

Then provide sample log data when prompted.

### `/tenzir:mapping-to-ocsf` skill

Adds OCSF (Open Cybersecurity Schema Framework) mapping to an existing parser
package. If no parser exists, it will invoke `/tenzir:managing-packages` first.

**Usage:**

```
/tenzir:mapping-to-ocsf
```

Then provide the package directory or sample log data when prompted.

### `tenzir:ocsf` subagent

Delegate OCSF questions for fast, accurate answers:

```
@tenzir:ocsf What class should I use for SSH login events?

@tenzir:ocsf What's the difference between actor and user objects?

@tenzir:ocsf Which profile adds container context to events?
```

### `tenzir:guide` subagent

Delegate Tenzir questions for fast, accurate answers from the documentation:

```
@tenzir:guide How do I parse JSON logs?

@tenzir:guide What operators filter events by field value?

@tenzir:guide How do I deploy a node on AWS?
```

# TQL

Build TQL pipelines with expert language guidance. Provides TQL language
fundamentals, integrates with live Tenzir documentation, and guides you through
creating parser packages and OCSF mappings.

## ✨ Features

- 📝 **Language Fundamentals**: Core TQL concepts including types, statements,
  expressions, and program structure
- 📚 **Documentation Lookup**: Query live Tenzir documentation for operators,
  functions, and syntax via the `docs:reader` subagent
- 📦 **Package Management**: Create and test Tenzir packages with proper
  structure and iterative testing workflows
- 🔧 **Parser Creation**: Guided workflow for building parsing pipelines from
  raw log data
- 🛡️ **OCSF Mapping**: Transform parsed events into OCSF-compliant format with
  validation

## 🚀 Usage

### `tql:writing-programs` skill

Activates when writing or debugging TQL programs. Loads TQL language
fundamentals and best practices from the idiomatic TQL tutorial. Spawns the
`docs:reader` subagent for real-time operator and function lookups.

**When it activates:**

- Writing TQL code or `.tql` files
- Asking about TQL syntax, operators, or functions
- Building or debugging data pipelines

**Example prompts:**

```
Write a pipeline that reads JSON from a file, filters events where
severity > 5, and writes to Parquet.
```

```
How do I aggregate network flows by source IP and count connections
per minute?
```

```
Parse CEF logs, extract the device vendor field, and enrich with
GeoIP data for source addresses.
```

**What you get:**

- Pipelines following TQL best practices (proper operator chaining, idiomatic
  patterns)
- Correct syntax for types, expressions, and statements
- Live documentation lookups when the skill needs operator details

### `tql:managing-packages` skill

Activates when creating or modifying Tenzir packages. Provides package structure
guidance and testing workflows using `tenzir-test`.

**When it activates:**

- Creating parser packages
- Adding operators or tests
- Running `tenzir-test`

### `/tql:make_parser` command

Guided workflow for creating a TQL parsing pipeline package from sample log
data. Walks through 5 phases: input analysis, package scaffolding, iterative
testing, sample synthesis, and summarization.

**Usage:**

```
/tql:make_parser
```

Then provide sample log data when prompted.

### `/tql:make_ocsf_mapping` command

Adds OCSF (Open Cybersecurity Schema Framework) mapping to an existing parser
package. If no parser exists, it will invoke `/tql:make_parser` first.

**Usage:**

```
/tql:make_ocsf_mapping
```

Then provide the package directory or sample log data when prompted.

## 🔗 Dependencies

For documentation lookup, install the docs plugin:

```
/plugin install docs@tenzir
```

For OCSF mapping, install the OCSF plugin:

```
/plugin install ocsf@tenzir
```

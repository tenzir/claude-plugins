# TQL

Build TQL pipelines with expert language guidance. Provides TQL language
fundamentals and integrates with live Tenzir documentation for operator and
function lookups.

## ✨ Features

- 📝 **Language Fundamentals**: Core TQL concepts including types, statements,
  expressions, and program structure
- 📚 **Documentation Lookup**: Query live Tenzir documentation for operators,
  functions, and syntax via the `docs:reader` subagent

## 📦 Installation

```
/plugin install tql@tenzir
```

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

## 🔗 Dependencies

For documentation lookup, install the docs plugin:

```
/plugin install docs@tenzir
```

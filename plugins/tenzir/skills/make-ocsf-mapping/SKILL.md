---
name: make-ocsf-mapping
description: Create an OCSF mapping inside a Tenzir package
disable-model-invocation: true
argument-hint: "[package-directory]"
---

# Add OCSF Mapping to a TQL Parsing Pipeline

Guide the user through adding OCSF (Open Cybersecurity Schema Framework) mapping
to an existing parser package.

## Preamble: TQL Fundamentals

Read the following pages unconditionally to understand the foundations of TQL:

- <https://docs.tenzir.com/explanations/language.md>
- <https://docs.tenzir.com/explanations/language/types.md>
- <https://docs.tenzir.com/explanations/language/statements.md>
- <https://docs.tenzir.com/explanations/language/expressions.md>
- <https://docs.tenzir.com/explanations/language/programs.md>

Critically, strictly adhere to the best practices in this language tutorial:

- <https://docs.tenzir.com/tutorials/learn-idiomatic-tql.md>

## Preamble: Package Management

Read the following pages to understand packages and testing:

- <https://docs.tenzir.com/explanations/packages.md>
- <https://docs.tenzir.com/reference/test-framework.md>
- <https://docs.tenzir.com/guides/testing/write-tests.md>

The `tenzir-ship` framework manages the `changelog/` directory. When adding
changelog entries to a package, spawn the `dev:changelog-adder` subagent.

## Workflow

Fetch the complete workflow from:

<https://docs.tenzir.com/reference/workflows/generate-an-ocsf-mapping.md>

Follow ALL phases in EXACT order. The workflow defines 4 phases:

0. **Create Parser Package**: Ensure a parser package exists before adding OCSF
   mapping. If no parser exists, invoke `/tenzir:make-parser` first.
1. **OCSF Target Analysis**: Identify the appropriate OCSF event class and plan
   the mapping
2. **OCSF Mapping Operator**: Create the OCSF mapping operator with proper
   structure
3. **Summarize**: Provide a final summary of the complete parser with OCSF
   mapping

You MUST state "Phase N complete" before proceeding to the next phase.

## OCSF Schema Lookup

For specific OCSF questions during the mapping process (event classes, objects,
attributes, profiles), spawn the `tenzir:ocsf` subagent. This fetches OCSF
schema documentation to help select the right class, understand attribute
requirements, and validate mappings.

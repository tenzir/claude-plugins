---
name: make-parser
description: Create a TQL parsing pipeline package from sample log data
disable-model-invocation: true
argument-hint: "[sample-file-or-data]"
---

# Create a TQL Parsing Pipeline

Guide the user through creating a Tenzir package that parses raw log data into
structured events.

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

<https://docs.tenzir.com/reference/workflows/generate-a-parser-package.md>

Follow ALL phases in EXACT order. The workflow defines 5 phases:

1. **Input Schema Analysis**: Learn about the input data and understand its
   structure
2. **Package Scaffolding**: Create the package structure for iterative
   development
3. **Iterate & Test**: Refine the parser until all fields are parsed and
   properly typed
4. **Bootstrap Sampling**: Create additional input samples to expand test
   coverage
5. **Summarize**: Provide a final summary of the parser's functionality

You MUST state "Phase N complete" before proceeding to the next phase.

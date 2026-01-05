---
description: Create a TQL parsing pipeline package from sample log data
---

# Create a TQL Parsing Pipeline

Guide the user through creating a Tenzir package that parses raw log data into
structured events.

Begin by invoking these skills:

- `tql:managing-packages`
- `tql:writing-programs`

You MUST follow the following phases in EXACT order.

## Phase 1: Input Schema Analysis

**Objective**: Learn about the input data and understand its structure.

**Steps**:

1. Ask the user to provide sample log data (file path or pasted content)
2. Identify the data source format (CSV, JSON, YAML, syslog, etc.)
3. Identify vendor and product that may have generated this data
4. Document the complete input schema in terms of fields and types

You MUST state "Phase 1 complete" before proceeding.

## Phase 2: Package Scaffolding

**Objective**: Create the package structure for iterative development.

**Prerequisites**: (read with the `docs:reader` subagent once per session)

- https://docs.tenzir.com/explanations/packages.md
- https://docs.tenzir.com/reference/test-framework.md
- https://docs.tenzir.com/guides/testing/write-tests.md

**Steps**:

1. Use `AskUserQuestion` to confirm the package ID (typically vendor name, e.g.,
   `fortinet`, `cisco`, `microsoft`). In the instructions below, replace `pkg`
   with the chosen package ID.
2. Create the package directory structure:

   ```
   <pkg>/
   ├── package.yaml
   ├── README.md
   ├── operators/
   │   └── parse.tql
   ├── tests/
   │   ├── parse.tql
   │   └── inputs/
   │       └── parse.txt
   └── changelog/
   ```

3. Create `package.yaml` with the package metadata.
4. Create the initial `parse` operator in `operators/parse.tql` with just
   `read_lines` as a starting point.
5. Create a test file `tests/parse.tql` that reads from the input:

   ```tql
   from_file f"{env("TENZIR_INPUTS")}/parse.txt" {
     pkg::parse
   }
   ```

   Note: Use an appropriate file extension for the input (`.json`, `.csv`,
   `.log`) based on the detected format.

6. Save the sample log data to `tests/inputs/parse.txt` (or appropriate
   extension).
7. Run `uvx tenzir-test --root <pkg> -u --summary` to create an initial
   baseline.

You MUST state "Phase 2 complete" before proceeding.

## Phase 3: Iterate & Test

**Objective**: Refine the parser until all fields are parsed and properly typed.

**Prerequisites**: (read with the `docs:reader` subagent once per session)

- https://docs.tenzir.com/guides/data-shaping/transform-basic-values/
- https://docs.tenzir.com/guides/data-shaping/extract-structured-data-from-text/
- https://docs.tenzir.com/guides/data-shaping/convert-data-formats/
- https://docs.tenzir.com/guides/data-shaping/reshape-complex-data/

**Steps**:

Loop until all fields are properly parsed:

1. Make ONE modification to the `parse` operator. Typical actions include:
   - **Date & time parsing**: Parse timestamps as type `time` or `duration`
     rather than keeping them as strings.
   - **IP addresses**: TQL has first-class IP address types; an `ip` literal
     has the form `1.2.3.4` (not `"1.2.3.4"`). Ensure all IP addresses are
     parsed as type `ip`.
   - **Subnets**: TQL has first-class subnet types; a `subnet` literal has
     the form `10.0.0.0/8`. Ensure all CIDR subnets are parsed as `subnet`.
   - **Strings**: Clean string artifacts with the `trim` function.
   - **Lists**: Parse comma-separated values surrounded by brackets as lists.
   - **Nested structures**: Parse nested structures using `parse_*` functions
     according to the value format.
   - **Sentinel values**: Use `replace` to normalize sentinel values:

     ```tql
     replace what="None", with=null
     replace what="N/A", with=null
     replace fieldname, what="NO", with=false
     ```

2. Run `uvx tenzir-test --root <pkg> --summary` and observe the output diff
3. If the diff looks good, run `uvx tenzir-test --root <pkg> -u --summary` to
   update the baseline
4. Go back to Step 1 and continue with the next modification

You MUST state "Phase 3 complete" before proceeding.

## Phase 4: Bootstrap Sampling

**Objective**: Create additional input samples to expand test coverage.

**Steps**:

1. Synthesize at least 3 sample input records based on the identified input
   fields. Vary the values to test edge cases.
2. Add the synthetic data to `tests/inputs/parse-synthetic.txt`
3. Create a corresponding test file `tests/parse-synthetic.tql`
4. Repeat Phase 3 iteration for the new samples

You MUST state "Phase 4 complete" before proceeding.

## Phase 5: Summarize

Provide a final summary of the parser's functionality:

- **Input**: Description of the input format and source
- **TQL**: The complete parsing logic
- **Output**: Description of the parsed schema with types
- **Package structure**: Tree view of the package
- **Noteworthy findings**: Any interesting discoveries or caveats

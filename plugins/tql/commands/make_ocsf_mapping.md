---
description: Create on OCSF mapping inside a Tenzir package
---

# Add OCSF Mapping to a TQL Parsing Pipeline

Guide the user through adding OCSF (Open Cybersecurity Schema Framework) mapping
to an existing parser package.

Begin by invoking these skills:

- `tql:managing-packages`
- `tql:writing-programs`
- `ocsf:understanding-ocsf`

For specific OCSF questions during the mapping process, spawn the `ocsf:guide`
subagent.

You MUST follow the following phases in EXACT order.

## Phase 0: Create Parser Package

**Objective**: Ensure a parser package exists before adding OCSF mapping.

**Steps**:

1. Ask the user for the package directory or sample log data
2. If a parser package exists (has `operators/parse.tql`), note the package
   directory and identifier, then proceed to Phase 1
3. If no parser exists, invoke `/tql:make_parser` to create one first

You MUST state "Phase 0 complete" before proceeding.

## Phase 1: OCSF Target Analysis

**Objective**: Identify the appropriate OCSF event class and plan the mapping.

**Prerequisites**: (read with the `docs:reader` subagent once per session)

- https://docs.tenzir.com/tutorials/map-data-to-ocsf.md

**Steps**:

1. Examine the parsed data schema (from the `parse` operator output) to
   understand available fields
2. Identify the most appropriate OCSF event class based on the data type. Use
   the `ocsf:guide` subagent to explore available classes:
   - Network Activity (proxy, firewall, DNS)
   - File Activity
   - Authentication
   - System Activity
   - Process Activity
   - etc.
3. Document which OCSF attribute groups will be populated:
   - **Classification**: `category_uid`, `class_uid`, `type_uid`, `activity_id`
   - **Occurrence**: `time`, `timezone_offset`
   - **Context**: `metadata`, `observables`
   - **Primary**: Class-specific fields (e.g., `src_endpoint`, `dst_endpoint`)
4. Identify needed profiles to achieve mapping completeness:
   - Host
   - OSINT
   - Security Control
   - Network Proxy
   - etc.
5. Note any gaps in the source data for populating OCSF fields

You MUST state "Phase 1 complete" before proceeding.

## Phase 2: OCSF Mapping Operator

**Objective**: Create the OCSF mapping operator with proper structure.

Let `pkg` be the package ID from Phase 0.

**Steps**:

1. Create a new operator `operators/ocsf/<type>.tql` where `<type>` is the event
   type (e.g., `proxy`, `flow`, `process`, `auth`)

2. Write TQL code that transforms parsed data into OCSF format. Structure the
   code with clear section comments:

   ```tql
   // --- Preamble ---------------------------------
   // Initial setup, invoke the parse operator if needed

   // --- OCSF: Classification ---------------------
   // category_uid, class_uid, type_uid, activity_id, severity_id

   // --- OCSF: Occurrence -------------------------
   // time, timezone_offset

   // --- OCSF: Context ----------------------------
   // metadata (log_name, product, uid, version)

   // --- OCSF: Primary ----------------------------
   // Class-specific required and recommended fields

   // --- OCSF: Profile: Host ----------------------
   // Host profile fields (if applicable)

   // --- OCSF: Profile: Network Proxy -------------
   // Proxy profile fields (if applicable)

   // --- Epilogue ---------------------------------
   // Final cleanup, unmapped fields handling
   ```

3. For the `metadata` object:
   - `log_name`: Populate only when unambiguous (static or from data)
   - `product`: Populate from log data or statically
   - `uid`: Extract a unique event ID from the data if available
   - `version`: Set to the OCSF version (e.g., `"1.4.0"`)

4. Create a test file `tests/ocsf/<type>.tql`:

   ```tql
   from_file f"{env("TENZIR_INPUTS")}/parse.txt" {
     pkg::parse
   }
   pkg::ocsf::<type>
   ocsf::cast
   ```

   The `ocsf::cast` operator validates the output against the OCSF schema and
   emits warnings on mismatches.

5. Run `uvx tenzir-test --root <pkg> --summary` and iterate until:
   - All warnings from `ocsf::cast` are resolved
   - The `unmapped` field is minimized (move fields to proper OCSF locations)

6. Update the baseline with `uvx tenzir-test --root <pkg> -u --summary`

You MUST state "Phase 2 complete" before proceeding.

## Phase 3: Summarize

Provide a final summary of the complete parser with OCSF mapping:

- **Package name and structure**: Tree view of the package
- **Parser functionality**: What the parser extracts from raw logs
- **Target OCSF class and version**: The selected event class
- **OCSF attribute groups populated**: Classification, Occurrence, Context,
  Primary
- **OCSF profiles used**: List of enabled profiles
- **Field mapping overview**: Source field → Parsed field → OCSF field
- **Sample input**: Raw log example
- **Sample intermediate**: Parsed data example
- **Sample output**: OCSF event example
- **Limitations**: Any missing OCSF fields or `unmapped` contents

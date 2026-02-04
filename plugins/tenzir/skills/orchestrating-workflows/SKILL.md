---
name: orchestrating-workflows
description: Orchestrate Tenzir workflows by spawning the workflow-executor agent for each step. Use when creating parser packages, adding OCSF mappings, or running multi-phase workflows.
skills:
  - tenzir:docs
---

# Orchestrate Tenzir Workflows

Guide the user through multi-step Tenzir workflows by breaking them into
trackable tasks and spawning specialized agents for each step.

## Available Workflows

The `tenzir:docs` skill provides these workflows in `reference/workflows/`.

## Workflow Selection

If the user hasn't specified a workflow:

1. Present the available workflows
2. Ask which workflow to run
3. Gather any required inputs (e.g., sample data, package directory)

## Orchestration Process

### Step 1: Read the Workflow

Load the workflow document via the `tenzir:docs` skill. Parse the numbered steps
and their **Results** criteria.

### Step 2: Create Task List

Use `TaskCreate` to create a task for each workflow step:

```
Subject: "Step N: <step title>"
Description: Include the step instructions, Results criteria, and Resources links
ActiveForm: "Executing step N"
```

### Step 3: Execute Steps

For each task in order:

1. Mark the task as `in_progress` with `TaskUpdate`
2. Spawn `tenzir:workflow-executor` with a prompt containing:
   - The step instructions
   - **Results** criteria to verify
   - **Resources** links for reference
3. Review the executor's output
4. If successful, mark the task as `completed`
5. If blocked, create a sub-task for the blocker and address it before continuing

### Step 4: Completion Summary

When all tasks are complete, provide a summary:

- **Workflow**: Name of completed workflow
- **Package**: Path to the created/updated package
- **Artifacts**: List of files created
- **Test status**: Summary of passing tests

## Example Executor Prompt

```
Execute Step 2 of the "Create a parser package" workflow.

**Step**: Create the package scaffold

**Instructions**:
Set up the directory structure and manifest file for your package.

**Results** (verify all before reporting done):
- A package for vendor `acme`
- A package manifest: `acme/package.yaml`
- Event samples in `acme/tests/inputs`

**Resources**:
- [Create a package](guides/packages/create-a-package.md)

Report status when complete.
```

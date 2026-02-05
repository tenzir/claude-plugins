---
name: orchestrating-workflows
description: Orchestrate Tenzir workflows. Use when executing Tenzir workflows.
---

Guide the user through multi-step Tenzir workflows by breaking them into
trackable tasks and spawning dedicated agents for each step.

Available workflows are in `/reference/workflows/` in the `tenzir:docs` skill.

If the user hasn't specified a workflow:

1. Present the available workflows
2. Ask which workflow to run
3. Create a tasklist that corresponds to the workflow steps:
   - Ensure proper dependencies between tasks
4. Execute the tasklist
   - Spawn one @tenzir:workflow-executor per step
   - Ensure that clear communication of expected results

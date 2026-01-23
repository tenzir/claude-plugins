---
name: plan
description: Review implementation plans via external models. Use when validating plans before execution.
argument-hint: "[model: codex|gemini|opus|provider/model]"
tools: Bash
model: haiku
color: yellow
skills: dev:reviewing-plans
---

# Plan Review Agent

Review the provided plan using an external model via opencode.
The plan file path is passed implicitly by Claude from its plan mode context.

## Input

- `model`: Model to use (shortcut or full ID)

## Model Shortcuts

The agent (Claude) resolves these shortcuts before invoking opencode:

| Shortcut | Model ID | Variant |
|----------|----------|---------|
| `codex` | `openai/gpt-5.2-codex` | `xhigh` |
| `gemini` | `google/gemini-flash-latest` | — |
| `opus` | `anthropic/claude-opus-4-5` | `max` |

Or pass full model ID directly (no variant).

## Workflow

1. Resolve model shortcut to full ID and variant if applicable
2. Invoke opencode with the plan file using a heredoc for the prompt:
   ```bash
   opencode run -m "$model" ${variant:+--variant "$variant"} -f "$plan_file" <<'EOF'
   Review this plan. Evaluate it across these dimensions:
   - Completeness (25%): Requirements coverage, missing steps, edge cases
   - Correctness (25%): Technical soundness, logical flaws, assumptions
   - Feasibility (20%): Implementability, realistic assumptions
   - Risk (15%): Security, performance, scalability concerns
   - Clarity (15%): Actionability, ambiguity

   Only report P1 (critical) and P2 (major) findings.

   Output format:
   VERDICT: [APPROVE|REVISE|BLOCK]

   ## Findings
   ### [P1/P2] Title
   **Dimension**: <dimension>
   **Issue**: <description>
   **Recommendation**: <fix>

   ## Summary
   <2-3 sentences>
   EOF
   ```
   The `${variant:+--variant "$variant"}` syntax only includes the flag when variant is non-empty.
3. Return the VERDICT and any P1/P2 findings

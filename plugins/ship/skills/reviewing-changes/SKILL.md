---
name: reviewing-changes
description: Review methodology for code changes with confidence scoring.
---

# Reviewing Changes

Review code changes with confidence-scored findings. This skill defines the
methodology for specialized reviewers.

## Confidence Scoring

Score each finding on a 0-100 scale:

| Score    | Severity   | Action                      |
| -------- | ---------- | --------------------------- |
| 91-100   | Critical   | Must fix before shipping    |
| 81-90    | Important  | Should fix, high confidence |
| 71-80    | Borderline | Filtered out by threshold   |
| Below 70 | Low        | Likely false positive       |

Only report findings with confidence 80 or higher.

### Scoring Criteria

- **Reproducibility**: Can the issue be demonstrated? (+15)
- **Impact severity**: How much does it affect users? (+20)
- **Clear violation**: Does it break a documented rule? (+20)
- **Frequency**: How often will users encounter it? (+15)
- **Fix complexity**: Is the fix straightforward? (+10)
- **Evidence strength**: How concrete is the evidence? (+20)

Deduct points for:

- Speculative concerns without concrete evidence (-20)
- Edge cases unlikely to occur in practice (-15)
- Style preferences not backed by convention (-15)
- Issues the codebase already handles elsewhere (-10)

## Output Format

Write findings to a markdown file (e.g., `.review/tests.md`):

```markdown
# <Aspect> Review

## Summary

Brief overall assessment (2-3 sentences).

## Findings

### [95] <Finding title>

- **File**: `path/to/file.ts:45-52`
- **Confidence**: 95/100 (Critical)
- **Issue**: Clear description of the problem
- **Suggestion**: Actionable fix recommendation

### [85] <Another finding>

- **File**: `path/to/file.ts:120`
- **Confidence**: 85/100 (Important)
- **Issue**: Description
- **Suggestion**: Recommendation

## Positive Observations

Note things done well to provide balanced feedback.
```

The bracketed score `[95]` enables automated parsing and filtering.

## Actionability Criteria

A finding is actionable when:

1. The issue is specific and locatable (file, line, function)
2. The suggestion provides a concrete fix, not vague advice
3. The fix can be applied without major refactoring
4. The benefit outweighs the implementation cost

Avoid reporting:

- Hypothetical future problems
- Matters of personal taste
- Issues outside the changed code
- Problems that require architectural changes

## Review Scope

Review only the files provided in the prompt. Don't review other files.

## Model Selection

Reviewer agents use different models based on review complexity:

- **opus**: Architecture review requires nuanced judgment about design tradeoffs
- **sonnet**: Security and docs need thorough analysis with good reasoning
- **haiku**: UX, tests, and consistency are pattern-matching tasks

This balances cost, speed, and capability across the six parallel reviewers.

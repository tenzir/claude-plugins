---
name: reviewing-changes
description: Review methodology for code changes with confidence scoring.
---

# Reviewing Changes

Review code changes with confidence-scored findings. This skill defines the
methodology for specialized reviewers.

## Two Rating Dimensions

### Severity Rating

Rate each finding's impact independently from confidence:

| Severity | Emoji | Impact                                          |
| -------- | ----- | ----------------------------------------------- |
| P1       | 🔴    | Critical — security, data loss, crashes         |
| P2       | 🟠    | Important — broken features, significant bugs   |
| P3       | 🟡    | Minor — edge cases, small bugs, inconsistencies |
| P4       | ⚪    | Trivial — cosmetic, style, optional             |

### Confidence Scoring

Score certainty that the finding is real on a 0-100 scale:

| Score    | Certainty | Meaning                   |
| -------- | --------- | ------------------------- |
| 91-100   | Very high | Definitely an issue       |
| 81-90    | High      | Almost certainly an issue |
| 71-80    | Moderate  | Likely an issue           |
| Below 70 | Low       | Possibly a false positive |

Only report findings with confidence 80 or higher.

### Independence of Dimensions

Confidence measures certainty; severity measures impact. Examples:

- P1 + 95% = Critical issue, definitely real
- P1 + 75% = Potentially critical, needs investigation
- P4 + 95% = Trivial issue, definitely real
- P4 + 60% = Trivial issue, might be wrong

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
- Concern doesn't apply to this project context (-20 to -40)

## Output Format

Write findings to a markdown file (e.g., `.review/tests.md`):

```markdown
# <Aspect> Review

## Summary

Brief overall assessment (2-3 sentences).

## Findings

### P1 · SQL injection vulnerability · 95%

- **File**: `path/to/file.ts:45-52`
- **Severity**: P1 — Critical
- **Confidence**: 95%
- **Issue**: User input passed directly to SQL query
- **Suggestion**: Use parameterized queries

### P3 · Missing null check · 85%

- **File**: `path/to/file.ts:120`
- **Severity**: P3 — Minor
- **Confidence**: 85%
- **Issue**: Description
- **Suggestion**: Recommendation
```

The `### P{n} · title · {n}%` pattern enables automated parsing and filtering.

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

## Review Scope

Focus on **changed code**. Do not emit findings for:

- Files outside the review scope
- Unchanged code unless directly related to the changes

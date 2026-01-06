# Check

The check object defines a specific, testable compliance verification point that evaluates a target device against a standard, framework, or custom requirement. While checks are typically associated with formal standards (like CIS, NIST, or ISO), they can also represent custom or organizational requirements. When mapped to controls, checks can evaluate specific control_parameters to determine compliance status, but neither the control mapping nor control_parameters are required for a valid check.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `desc` | string_t | optional |
| `name` | string_t | recommended |
| `severity` | string_t | optional |
| `severity_id` | integer_t | optional |
| `standards` | string_t | recommended |
| `status` | string_t | recommended |
| `status_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `version` | string_t | optional |

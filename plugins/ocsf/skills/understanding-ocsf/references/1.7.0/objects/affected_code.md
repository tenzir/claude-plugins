# Affected Code

The Affected Code object describes details about a code block identified as vulnerable.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `end_column` | integer_t | recommended |
| `end_line` | integer_t | recommended |
| `file` | object (file) | required |
| `owner` | object (user) | optional |
| `remediation` | object (remediation) | optional |
| `rule` | object (rule) | recommended |
| `start_column` | integer_t | recommended |
| `start_line` | integer_t | recommended |

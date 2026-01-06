# Analytic

The Analytic object contains details about the analytic technique used to analyze and derive insights from the data or information that led to the creation of a finding or conclusion.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `algorithm` | string_t | optional |
| `category` | string_t | optional |
| `desc` | string_t | optional |
| `name` | string_t | recommended |
| `related_analytics` | object (analytic) | optional |
| `state` | string_t | optional |
| `state_id` | integer_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | recommended |
| `version` | string_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [security_finding](../classes/security_finding.md)

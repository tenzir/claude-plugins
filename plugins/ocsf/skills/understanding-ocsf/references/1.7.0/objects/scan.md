# Scan

The Scan object describes characteristics of a proactive scan.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [file_remediation_activity](../classes/file_remediation_activity.md)
- [network_remediation_activity](../classes/network_remediation_activity.md)
- [process_remediation_activity](../classes/process_remediation_activity.md)
- [remediation_activity](../classes/remediation_activity.md)
- [scan_activity](../classes/scan_activity.md)

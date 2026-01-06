# MITRE D3FEND™

The MITRE D3FEND™ object describes the tactic & technique associated with a countermeasure.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `d3f_tactic` | object (d3f_tactic) | recommended |
| `d3f_technique` | object (d3f_technique) | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `d3f_tactic`, `d3f_technique`

## Used By

- [file_remediation_activity](../classes/file_remediation_activity.md)
- [network_remediation_activity](../classes/network_remediation_activity.md)
- [process_remediation_activity](../classes/process_remediation_activity.md)
- [remediation_activity](../classes/remediation_activity.md)

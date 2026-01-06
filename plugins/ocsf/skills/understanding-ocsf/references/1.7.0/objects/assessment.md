# Assessment

The Assessment object describes a point-in-time assessment, check, or evaluation of a specific configuration or signal against an asset, entity, person, or otherwise. For example, this can encapsulate `os_signals` from CrowdStrike Falcon Zero Trust Assessments, or account for `Datastore` configurations from Cyera, or capture details of Microsoft Intune configuration policies.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `category` | string_t | optional |
| `desc` | string_t | recommended |
| `meets_criteria` | boolean_t | required |
| `name` | string_t | recommended |
| `policy` | object (policy) | optional |
| `uid` | string_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [config_state](../classes/config_state.md)

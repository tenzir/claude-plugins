# Registry Key

The registry key object describes a Windows registry key.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `is_system` | boolean_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `path` | reg_key_path_t | required |
| `security_descriptor` | string_t | optional |

## Used By

- [win/registry_key_activity](../classes/win/registry_key_activity.md)
- [win/registry_key_activity](../classes/win/registry_key_activity.md)
- [win/registry_key_query](../classes/win/registry_key_query.md)

# Registry Value

The registry value object describes a Windows registry value.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `data` | json_t | optional |
| `is_default` | boolean_t | optional |
| `is_system` | boolean_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | required |
| `path` | reg_key_path_t | required |
| `reg_binary_data` | bytestring_t | optional |
| `reg_integer_data` | long_t | optional |
| `reg_string_data` | string_t | optional |
| `reg_string_list_data` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |

## Used By

- [win/registry_value_activity](../classes/win/registry_value_activity.md)
- [win/registry_value_activity](../classes/win/registry_value_activity.md)
- [win/registry_value_query](../classes/win/registry_value_query.md)

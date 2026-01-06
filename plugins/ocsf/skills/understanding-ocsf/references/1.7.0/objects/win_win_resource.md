# Windows Resource

The Windows resource object describes a resource object managed by Windows, such as mutant or timer.

**Extends**: _resource

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `data` | json_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `details` | string_t | optional |
| `labels` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `svc_name` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | resource_uid_t | recommended |
| `uid_alt` | resource_uid_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [win/windows_resource_activity](../classes/win/windows_resource_activity.md)

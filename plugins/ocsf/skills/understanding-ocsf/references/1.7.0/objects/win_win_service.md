# Windows Service

The Windows Service object describes a Windows service.

**Extends**: service

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cmd_line` | string_t | recommended |
| `hosting_process` | object (process_entity) | optional |
| `labels` | string_t | optional |
| `load_order_group` | string_t | recommended |
| `name` | string_t | required |
| `service_category` | string_t | optional |
| `service_category_id` | integer_t | recommended |
| `service_dependencies` | string_t | recommended |
| `service_dll_file` | object (file) | optional |
| `service_error_control` | string_t | optional |
| `service_error_control_id` | integer_t | recommended |
| `service_file` | object (file) | recommended |
| `service_start_name` | string_t | recommended |
| `service_start_type` | string_t | optional |
| `service_start_type_id` | integer_t | recommended |
| `service_type` | string_t | optional |
| `service_type_id` | integer_t | recommended |
| `tags` | object (key_value_object) | optional |
| `uid` | string_t | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `cmd_line`, `service_category_id`, `service_dependencies`, `service_error_control_id`, `service_start_name`, `service_start_type_id`, `service_type_id`

## Used By

- [win/windows_service_activity](../classes/win/windows_service_activity.md)

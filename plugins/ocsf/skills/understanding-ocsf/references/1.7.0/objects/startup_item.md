# Startup Item

The startup item object describes an application component that has associated startup criteria and configurations.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `driver` | object (kernel_driver) | optional |
| `job` | object (job) | optional |
| `name` | string_t | required |
| `process` | object (process) | optional |
| `run_mode_ids` | integer_t | optional |
| `run_modes` | string_t | optional |
| `run_state` | string_t | optional |
| `run_state_id` | integer_t | recommended |
| `start_type` | string_t | optional |
| `start_type_id` | integer_t | required |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `win_service` | object (win/win_service) | optional |

## Used By

- [startup_item_query](../classes/startup_item_query.md)

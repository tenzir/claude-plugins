# Query Evidence

The specific resulting evidence information that was queried or discovered. When mapping raw telemetry data users should select the appropriate child object that best matches the evidence type as defined by query_type_id.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `connection_info` | object (network_connection_info) | recommended |
| `file` | object (file) | recommended |
| `folder` | object (file) | recommended |
| `group` | object (group) | recommended |
| `job` | object (job) | recommended |
| `kernel` | object (kernel) | recommended |
| `module` | object (module) | recommended |
| `network_interfaces` | object (network_interface) | recommended |
| `peripheral_device` | object (peripheral_device) | recommended |
| `process` | object (process) | recommended |
| `query_type` | string_t | optional |
| `query_type_id` | integer_t | required |
| `reg_key` | object (win/reg_key) | recommended |
| `reg_value` | object (win/reg_value) | recommended |
| `service` | object (service) | recommended |
| `session` | object (session) | recommended |
| `startup_item` | object (startup_item) | recommended |
| `state` | string_t | optional |
| `tcp_state_id` | integer_t | optional |
| `user` | object (user) | recommended |
| `users` | object (user) | optional |

## Used By

- [evidence_info](../classes/evidence_info.md)

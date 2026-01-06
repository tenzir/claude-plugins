# Process

The Process object describes a running instance of a launched program.

**Extends**: process_entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `ancestry` | object (process_entity) | optional |
| `auid` | integer_t | optional |
| `cmd_line` | string_t | recommended |
| `container` | object (container) | recommended |
| `cpid` | uuid_t | recommended |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `egid` | integer_t | optional |
| `environment_variables` | object (environment_variable) | optional |
| `euid` | integer_t | optional |
| `file` | object (file) | recommended |
| `group` | object (group) | recommended |
| `hosted_services` | object (win/win_service) | optional |
| `integrity` | string_t | optional |
| `integrity_id` | integer_t | optional |
| `lineage` | file_path_t | optional |
| `loaded_modules` | string_t | optional |
| `name` | process_name_t | recommended |
| `namespace_pid` | integer_t | recommended |
| `parent_process` | object (process) | recommended |
| `path` | string_t | optional |
| `pid` | integer_t | recommended |
| `ptid` | long_t | optional |
| `sandbox` | string_t | optional |
| `session` | object (session) | optional |
| `terminated_time` | timestamp_t | optional |
| `terminated_time_dt` | datetime_t | optional |
| `tid` | integer_t | optional |
| `uid` | string_t | recommended |
| `user` | object (user) | recommended |
| `working_directory` | string_t | optional |
| `xattributes` | object (object) | optional |

## Constraints

At least one of: `pid`, `uid`, `cpid`

## Used By

- [authentication](../classes/authentication.md)
- [memory_activity](../classes/memory_activity.md)
- [module_query](../classes/module_query.md)
- [network_connection_query](../classes/network_connection_query.md)
- [process_activity](../classes/process_activity.md)
- [process_query](../classes/process_query.md)
- [process_remediation_activity](../classes/process_remediation_activity.md)
- [security_finding](../classes/security_finding.md)

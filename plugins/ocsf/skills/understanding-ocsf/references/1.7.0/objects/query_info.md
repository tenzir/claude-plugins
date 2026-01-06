# Query Information

The query info object holds information related to data access within a datastore. To access, manipulate, delete, or retrieve data from a datastore, a query must be written using a specific syntax.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `bytes` | long_t | optional |
| `data` | json_t | optional |
| `name` | string_t | recommended |
| `query_string` | string_t | required |
| `query_time` | timestamp_t | optional |
| `query_time_dt` | datetime_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [admin_group_query](../classes/admin_group_query.md)
- [datastore_activity](../classes/datastore_activity.md)
- [evidence_info](../classes/evidence_info.md)
- [file_query](../classes/file_query.md)
- [folder_query](../classes/folder_query.md)
- [job_query](../classes/job_query.md)
- [kernel_object_query](../classes/kernel_object_query.md)
- [module_query](../classes/module_query.md)
- [network_connection_query](../classes/network_connection_query.md)
- [networks_query](../classes/networks_query.md)
- [peripheral_device_query](../classes/peripheral_device_query.md)
- [process_query](../classes/process_query.md)
- [service_query](../classes/service_query.md)
- [session_query](../classes/session_query.md)
- [startup_item_query](../classes/startup_item_query.md)
- [user_query](../classes/user_query.md)
- [win/prefetch_query](../classes/win/prefetch_query.md)
- [win/registry_key_query](../classes/win/registry_key_query.md)
- [win/registry_value_query](../classes/win/registry_value_query.md)

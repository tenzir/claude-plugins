# Kernel Resource

The Kernel Resource object provides information about a specific kernel resource, including its name and type. It describes essential attributes associated with a resource managed by the kernel of an operating system.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `is_system` | boolean_t | optional |
| `name` | string_t | required |
| `path` | file_path_t | optional |
| `system_call` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |

## Used By

- [kernel_activity](../classes/kernel_activity.md)
- [kernel_object_query](../classes/kernel_object_query.md)

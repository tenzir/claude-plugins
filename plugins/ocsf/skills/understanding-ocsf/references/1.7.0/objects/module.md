# Module

The Module object describes the attributes of a module.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `base_address` | string_t | recommended |
| `file` | object (file) | recommended |
| `function_invocation` | object (function_invocation) | optional |
| `function_name` | string_t | recommended |
| `load_type` | string_t | optional |
| `load_type_id` | integer_t | recommended |
| `start_address` | string_t | recommended |
| `type` | string_t | recommended |

## Constraints

At least one of: `load_type_id`, `function_name`

## Used By

- [module_activity](../classes/module_activity.md)
- [module_query](../classes/module_query.md)
- [process_activity](../classes/process_activity.md)

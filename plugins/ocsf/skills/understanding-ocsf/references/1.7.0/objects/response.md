# Response Elements

The Response Elements object describes characteristics of an API response.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `code` | integer_t | recommended |
| `containers` | object (container) | optional |
| `data` | json_t | optional |
| `error` | string_t | recommended |
| `error_message` | string_t | recommended |
| `flags` | string_t | optional |
| `message` | string_t | recommended |

## Used By

- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)

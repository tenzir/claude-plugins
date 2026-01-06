# Long String

This object is a used to capture strings which may be truncated by a security product due to their length.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `is_truncated` | boolean_t | optional |
| `untruncated_size` | integer_t | optional |
| `value` | string_t | required |

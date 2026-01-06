# Image

The Image object provides a description of a specific Virtual Machine (VM) or Container image.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `labels` | string_t | optional |
| `name` | string_t | recommended |
| `path` | file_path_t | optional |
| `tag` | string_t | optional |
| `tags` | object (key_value_object) | optional |
| `uid` | string_t | required |

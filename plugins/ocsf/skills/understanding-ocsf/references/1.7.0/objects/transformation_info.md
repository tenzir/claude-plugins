# Transformation Info

The transformation_info object represents the mapping or transformation used.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `lang` | string_t | optional |
| `name` | string_t | recommended |
| `product` | object (product) | optional |
| `time` | timestamp_t | recommended |
| `time_dt` | datetime_t | optional |
| `uid` | string_t | optional |
| `url_string` | url_t | recommended |

## Constraints

At least one of: `name`, `uid`

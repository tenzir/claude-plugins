# KB Article

The KB Article object contains metadata that describes the patch or update.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `avg_timespan` | object (timespan) | optional |
| `bulletin` | string_t | optional |
| `classification` | string_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `install_state` | string_t | recommended |
| `install_state_id` | integer_t | recommended |
| `is_superseded` | boolean_t | optional |
| `os` | object (os) | recommended |
| `product` | object (product) | optional |
| `severity` | string_t | recommended |
| `size` | long_t | optional |
| `src_url` | url_t | optional |
| `title` | string_t | recommended |
| `uid` | string_t | recommended |

## Constraints

At least one of: `uid`, `src_url`

## Used By

- [patch_state](../classes/patch_state.md)

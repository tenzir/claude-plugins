# Software Bill of Materials

The Software Bill of Materials object describes characteristics of a generated SBOM.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `package` | object (package) | required |
| `product` | object (product) | recommended |
| `software_components` | object (software_component) | required |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | optional |
| `version` | string_t | optional |

## Used By

- [software_info](../classes/software_info.md)

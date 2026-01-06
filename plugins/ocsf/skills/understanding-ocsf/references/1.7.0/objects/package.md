# Software Package

The Software Package object describes details about a software package.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `architecture` | string_t | recommended |
| `cpe_name` | string_t | optional |
| `epoch` | integer_t | optional |
| `hash` | object (fingerprint) | optional |
| `license` | string_t | optional |
| `license_url` | url_t | optional |
| `name` | string_t | required |
| `package_manager` | string_t | optional |
| `package_manager_url` | url_t | optional |
| `purl` | string_t | optional |
| `release` | string_t | optional |
| `src_url` | url_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | optional |
| `vendor_name` | string_t | optional |
| `version` | string_t | required |

## Used By

- [software_info](../classes/software_info.md)

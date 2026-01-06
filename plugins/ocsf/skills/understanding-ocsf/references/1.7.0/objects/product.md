# Product

The Product object describes characteristics of a software product.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cpe_name` | string_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `feature` | object (feature) | optional |
| `lang` | string_t | optional |
| `name` | string_t | recommended |
| `path` | string_t | optional |
| `uid` | string_t | recommended |
| `url_string` | url_t | optional |
| `vendor_name` | string_t | recommended |
| `version` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [application_lifecycle](../classes/application_lifecycle.md)
- [software_info](../classes/software_info.md)

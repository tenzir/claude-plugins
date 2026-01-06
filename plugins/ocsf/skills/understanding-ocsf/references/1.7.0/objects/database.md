# Database

The database object is used for databases which are typically datastore services that contain an organized collection of structured and unstructured data or a types of data.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `desc` | string_t | optional |
| `groups` | object (group) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `size` | long_t | optional |
| `type` | string_t | recommended |
| `type_id` | integer_t | required |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)

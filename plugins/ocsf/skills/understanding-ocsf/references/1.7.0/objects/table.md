# Table

The table object represents a table within a structured relational database or datastore, which contains columns and rows of data that are able to be create, updated, deleted and queried.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `desc` | string_t | optional |
| `groups` | object (group) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `size` | long_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)

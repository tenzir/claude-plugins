# Databucket

The databucket object is a basic container that holds data, typically organized through the use of data partitions.

**Extends**: _resource

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `agent_list` | object (agent) | optional |
| `cloud_partition` | string_t | optional |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `criticality` | string_t | optional |
| `data` | json_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `desc` | string_t | optional |
| `encryption_details` | object (encryption_details) | optional |
| `file` | object (file) | optional |
| `group` | object (group) | optional |
| `groups` | object (group) | optional |
| `hostname` | hostname_t | recommended |
| `ip` | ip_t | recommended |
| `is_backed_up` | boolean_t | optional |
| `is_encrypted` | boolean_t | optional |
| `is_public` | boolean_t | recommended |
| `labels` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `namespace` | string_t | optional |
| `owner` | object (user) | recommended |
| `region` | string_t | optional |
| `resource_relationship` | object (graph) | optional |
| `size` | long_t | optional |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | recommended |
| `type_id` | integer_t | required |
| `uid` | resource_uid_t | recommended |
| `uid_alt` | resource_uid_t | optional |
| `version` | string_t | optional |
| `zone` | string_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)

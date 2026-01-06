# Web Resource

The Web Resource object describes characteristics of a web resource that was affected by the activity/event.

**Extends**: _resource

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `data` | json_t | optional |
| `data_classification` | object (data_classification) | recommended |
| `data_classifications` | object (data_classification) | recommended |
| `desc` | string_t | optional |
| `labels` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | optional |
| `uid` | resource_uid_t | recommended |
| `uid_alt` | resource_uid_t | optional |
| `url_string` | url_t | recommended |

## Constraints

At least one of: `name`, `uid`

## Used By

- [web_resource_access_activity](../classes/web_resource_access_activity.md)
- [web_resources_activity](../classes/web_resources_activity.md)
- [web_resources_activity](../classes/web_resources_activity.md)

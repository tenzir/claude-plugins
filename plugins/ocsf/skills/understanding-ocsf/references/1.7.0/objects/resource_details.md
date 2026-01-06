# Resource Details

The Resource Details object describes details about resources that were affected by the activity/event.

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
| `group` | object (group) | optional |
| `hostname` | hostname_t | recommended |
| `ip` | ip_t | recommended |
| `is_backed_up` | boolean_t | optional |
| `labels` | string_t | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | recommended |
| `namespace` | string_t | optional |
| `owner` | object (user) | recommended |
| `region` | string_t | optional |
| `resource_relationship` | object (graph) | optional |
| `role` | string_t | optional |
| `role_id` | integer_t | recommended |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | optional |
| `uid` | resource_uid_t | recommended |
| `uid_alt` | resource_uid_t | optional |
| `version` | string_t | optional |
| `zone` | string_t | optional |

## Constraints

At least one of: `name`, `uid`

## Used By

- [api_activity](../classes/api_activity.md)
- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [compliance_finding](../classes/compliance_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [group_management](../classes/group_management.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [security_finding](../classes/security_finding.md)
- [user_access](../classes/user_access.md)
- [user_access](../classes/user_access.md)
- [vulnerability_finding](../classes/vulnerability_finding.md)
- [vulnerability_finding](../classes/vulnerability_finding.md)

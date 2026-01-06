# Actor

The Actor object contains details about the user, role, application, service, or process that initiated or performed a specific activity. Note that Actor is not the threat actor of a campaign but may be part of a campaign.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `app_name` | string_t | optional |
| `app_uid` | string_t | optional |
| `authorizations` | object (authorization) | optional |
| `idp` | object (idp) | optional |
| `invoked_by` | string_t | optional |
| `process` | object (process) | recommended |
| `session` | object (session) | optional |
| `user` | object (user) | recommended |

## Constraints

At least one of: `process`, `user`, `invoked_by`, `session`, `app_name`, `app_uid`

## Used By

- [account_change](../classes/account_change.md)
- [admin_group_query](../classes/admin_group_query.md)
- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [api_activity](../classes/api_activity.md)
- [application_error](../classes/application_error.md)
- [application_lifecycle](../classes/application_lifecycle.md)
- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [base_event](../classes/base_event.md)
- [cloud_resources_inventory_info](../classes/cloud_resources_inventory_info.md)
- [compliance_finding](../classes/compliance_finding.md)
- [config_state](../classes/config_state.md)
- [data_security_finding](../classes/data_security_finding.md)
- [datastore_activity](../classes/datastore_activity.md)
- [detection_finding](../classes/detection_finding.md)
- [device_config_state_change](../classes/device_config_state_change.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- ... (63 more)

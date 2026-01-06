# User

The User object describes the characteristics of a user/person or a security principal.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `account` | object (account) | optional |
| `credential_uid` | string_t | optional |
| `display_name` | string_t | optional |
| `domain` | string_t | optional |
| `email_addr` | email_t | optional |
| `forward_addr` | email_t | optional |
| `full_name` | string_t | optional |
| `groups` | object (group) | optional |
| `has_mfa` | boolean_t | recommended |
| `ldap_person` | object (ldap_person) | optional |
| `name` | username_t | recommended |
| `org` | object (organization) | optional |
| `phone_number` | string_t | optional |
| `programmatic_credentials` | object (programmatic_credential) | optional |
| `risk_level` | string_t | optional |
| `risk_level_id` | integer_t | optional |
| `risk_score` | integer_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |

## Constraints

At least one of: `account`, `name`, `uid`

## Used By

- [account_change](../classes/account_change.md)
- [account_change](../classes/account_change.md)
- [admin_group_query](../classes/admin_group_query.md)
- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [compliance_finding](../classes/compliance_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [group_management](../classes/group_management.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [incident_finding](../classes/incident_finding.md)
- [rdp_activity](../classes/rdp_activity.md)
- [tunnel_activity](../classes/tunnel_activity.md)
- [user_access](../classes/user_access.md)
- [user_inventory](../classes/user_inventory.md)
- [user_query](../classes/user_query.md)
- ... (1 more)

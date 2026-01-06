# OSINT

The OSINT (Open Source Intelligence) object contains details related to an indicator such as the indicator itself, related indicators, geolocation, registrar information, subdomains, analyst commentary, and other contextual information. This information can be used to further enrich a detection or finding by providing decisioning support to other analysts and engineers.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `answers` | object (dns_answer) | optional |
| `attacks` | object (attack) | optional |
| `autonomous_system` | object (autonomous_system) | optional |
| `campaign` | object (campaign) | optional |
| `category` | string_t | optional |
| `comment` | string_t | optional |
| `confidence` | string_t | optional |
| `confidence_id` | integer_t | recommended |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `creator` | object (user) | optional |
| `desc` | string_t | optional |
| `detection_pattern` | string_t | optional |
| `detection_pattern_type` | string_t | optional |
| `detection_pattern_type_id` | integer_t | optional |
| `email` | object (email) | optional |
| `email_auth` | object (email_auth) | optional |
| `expiration_time` | timestamp_t | optional |
| `expiration_time_dt` | datetime_t | optional |
| `external_uid` | string_t | optional |
| `file` | object (file) | optional |
| `intrusion_sets` | string_t | optional |
| `kill_chain` | object (kill_chain_phase) | optional |
| `labels` | string_t | optional |
| `location` | object (location) | optional |
| `malware` | object (malware) | optional |
| `modified_time` | timestamp_t | optional |
| `modified_time_dt` | datetime_t | optional |
| `name` | string_t | optional |
| `references` | string_t | optional |
| `related_analytics` | object (analytic) | optional |
| `reputation` | object (reputation) | optional |
| `risk_score` | integer_t | optional |
| `script` | object (script) | optional |
| `severity` | string_t | optional |
| `severity_id` | integer_t | optional |
| `signatures` | object (digital_signature) | optional |
| `src_url` | url_t | optional |
| `subdomains` | string_t | optional |
| `subnet` | subnet_t | optional |
| `threat_actor` | object (threat_actor) | optional |
| `tlp` | string_t | recommended |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | optional |
| `uploaded_time` | timestamp_t | optional |
| `uploaded_time_dt` | datetime_t | optional |
| `value` | string_t | required |
| `vendor_name` | string_t | optional |
| `vulnerabilities` | object (vulnerability) | optional |
| `whois` | object (whois) | optional |

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

# Account Change (3001)

Account Change events report when specific user account management tasks are performed, such as a user/role being created, changed, deleted, renamed, disabled, enabled, locked out or unlocked.

**Category**: Identity & Access Management
**Extends**: iam
**UID**: 3001

## Profiles

`cloud`, `datetime`, `host`, `osint`, `security_control`, `container`, `data_classification`, `linux/linux_users`

## Attributes

### Required

| Attribute | Type |
|-----------|------|
| `activity_id` | integer_t |
| `category_uid` | integer_t |
| `class_uid` | integer_t |
| `cloud` | object (cloud) |
| `metadata` | object (metadata) |
| `osint` | object (osint) |
| `severity_id` | integer_t |
| `time` | timestamp_t |
| `type_uid` | long_t |
| `user` | object (user) |

### Recommended

| Attribute | Type |
|-----------|------|
| `action_id` | integer_t |
| `actor` | object (actor) |
| `confidence_id` | integer_t |
| `device` | object (device) |
| `disposition_id` | integer_t |
| `is_alert` | boolean_t |
| `message` | string_t |
| `observables` | object (observable) |
| `src_endpoint` | object (network_endpoint) |
| `status` | string_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `user_result` | object (user) |

### Optional

| Attribute | Type |
|-----------|------|
| `action` | string_t |
| `activity_name` | string_t |
| `api` | object (api) |
| `attacks` | object (attack) |
| `auth_factors` | object (auth_factor) |
| `authorizations` | object (authorization) |
| `category_name` | string_t |
| `class_name` | string_t |
| `confidence` | string_t |
| `confidence_score` | integer_t |
| `count` | integer_t |
| `disposition` | string_t |
| `duration` | long_t |
| `end_time` | timestamp_t |
| `end_time_dt` | datetime_t |
| `enrichments` | object (enrichment) |
| `firewall_rule` | object (firewall_rule) |
| `http_request` | object (http_request) |
| `http_response` | object (http_response) |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `policies` | object (policy) |
| `policy` | object (policy) |
| `raw_data` | string_t |
| `raw_data_hash` | object (fingerprint) |
| `raw_data_size` | long_t |
| `risk_details` | string_t |
| `risk_level` | string_t |
| `risk_level_id` | integer_t |
| `risk_score` | integer_t |
| `severity` | string_t |
| `start_time` | timestamp_t |
| `start_time_dt` | datetime_t |
| `time_dt` | datetime_t |
| `type_name` | string_t |
| `unmapped` | object (object) |

## Objects Used

- [actor](../objects/actor.md)
- [api](../objects/api.md)
- [attack](../objects/attack.md)
- [auth_factor](../objects/auth_factor.md)
- [authorization](../objects/authorization.md)
- [cloud](../objects/cloud.md)
- [device](../objects/device.md)
- [enrichment](../objects/enrichment.md)
- [fingerprint](../objects/fingerprint.md)
- [firewall_rule](../objects/firewall_rule.md)
- [http_request](../objects/http_request.md)
- [http_response](../objects/http_response.md)
- [malware](../objects/malware.md)
- [malware_scan_info](../objects/malware_scan_info.md)
- [metadata](../objects/metadata.md)
- [network_endpoint](../objects/network_endpoint.md)
- [object](../objects/object.md)
- [observable](../objects/observable.md)
- [osint](../objects/osint.md)
- [policy](../objects/policy.md)
- [user](../objects/user.md)

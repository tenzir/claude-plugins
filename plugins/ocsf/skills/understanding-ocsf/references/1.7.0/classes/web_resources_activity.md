# Web Resources Activity (6001)

Web Resources Activity events describe actions executed on a set of Web Resources.

**Category**: Application Activity
**Extends**: application
**UID**: 6001

## Profiles

`cloud`, `datetime`, `host`, `osint`, `security_control`, `network_proxy`, `data_classification`, `container`, `linux/linux_users`

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
| `web_resources` | object (web_resource) |

### Recommended

| Attribute | Type |
|-----------|------|
| `action_id` | integer_t |
| `confidence_id` | integer_t |
| `device` | object (device) |
| `disposition_id` | integer_t |
| `dst_endpoint` | object (network_endpoint) |
| `http_request` | object (http_request) |
| `is_alert` | boolean_t |
| `message` | string_t |
| `observables` | object (observable) |
| `proxy_connection_info` | object (network_connection_info) |
| `proxy_tls` | object (tls) |
| `proxy_traffic` | object (network_traffic) |
| `src_endpoint` | object (network_endpoint) |
| `status` | string_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `web_resources_result` | object (web_resource) |

### Optional

| Attribute | Type |
|-----------|------|
| `action` | string_t |
| `activity_name` | string_t |
| `actor` | object (actor) |
| `api` | object (api) |
| `attacks` | object (attack) |
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
| `http_response` | object (http_response) |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `policy` | object (policy) |
| `proxy_endpoint` | object (network_proxy) |
| `proxy_http_request` | object (http_request) |
| `proxy_http_response` | object (http_response) |
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
| `tls` | object (tls) |
| `type_name` | string_t |
| `unmapped` | object (object) |

## Objects Used

- [actor](../objects/actor.md)
- [api](../objects/api.md)
- [attack](../objects/attack.md)
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
- [network_connection_info](../objects/network_connection_info.md)
- [network_endpoint](../objects/network_endpoint.md)
- [network_proxy](../objects/network_proxy.md)
- [network_traffic](../objects/network_traffic.md)
- [object](../objects/object.md)
- [observable](../objects/observable.md)
- [osint](../objects/osint.md)
- [policy](../objects/policy.md)
- [tls](../objects/tls.md)
- [web_resource](../objects/web_resource.md)

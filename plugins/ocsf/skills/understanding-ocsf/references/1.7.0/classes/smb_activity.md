# SMB Activity (4006)

Server Message Block (SMB) Protocol Activity events report client/server connections sharing resources within the network.

**Category**: Network Activity
**Extends**: network
**UID**: 4006

## Profiles

`cloud`, `datetime`, `host`, `osint`, `security_control`, `network_proxy`, `load_balancer`, `data_classification`, `container`, `linux/linux_users`

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

### Recommended

| Attribute | Type |
|-----------|------|
| `action_id` | integer_t |
| `client_dialects` | string_t |
| `command` | string_t |
| `confidence_id` | integer_t |
| `connection_info` | object (network_connection_info) |
| `device` | object (device) |
| `dialect` | string_t |
| `disposition_id` | integer_t |
| `dst_endpoint` | object (network_endpoint) |
| `file` | object (file) |
| `is_alert` | boolean_t |
| `load_balancer` | object (load_balancer) |
| `message` | string_t |
| `observables` | object (observable) |
| `open_type` | string_t |
| `proxy` | object (network_proxy) |
| `proxy_connection_info` | object (network_connection_info) |
| `proxy_tls` | object (tls) |
| `proxy_traffic` | object (network_traffic) |
| `response` | object (response) |
| `share` | string_t |
| `share_type` | string_t |
| `share_type_id` | integer_t |
| `src_endpoint` | object (network_endpoint) |
| `status` | string_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `traffic` | object (network_traffic) |
| `tree_uid` | string_t |

### Optional

| Attribute | Type |
|-----------|------|
| `action` | string_t |
| `activity_name` | string_t |
| `actor` | object (actor) |
| `api` | object (api) |
| `app_name` | string_t |
| `attacks` | object (attack) |
| `authorizations` | object (authorization) |
| `category_name` | string_t |
| `class_name` | string_t |
| `confidence` | string_t |
| `confidence_score` | integer_t |
| `count` | integer_t |
| `cumulative_traffic` | object (network_traffic) |
| `dce_rpc` | object (dce_rpc) |
| `disposition` | string_t |
| `duration` | long_t |
| `end_time` | timestamp_t |
| `end_time_dt` | datetime_t |
| `enrichments` | object (enrichment) |
| `firewall_rule` | object (firewall_rule) |
| `ja4_fingerprint_list` | object (ja4_fingerprint) |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `observation_point` | string_t |
| `observation_point_id` | integer_t |
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
- [dce_rpc](../objects/dce_rpc.md)
- [device](../objects/device.md)
- [enrichment](../objects/enrichment.md)
- [file](../objects/file.md)
- [fingerprint](../objects/fingerprint.md)
- [firewall_rule](../objects/firewall_rule.md)
- [http_request](../objects/http_request.md)
- [http_response](../objects/http_response.md)
- [ja4_fingerprint](../objects/ja4_fingerprint.md)
- [load_balancer](../objects/load_balancer.md)
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
- [response](../objects/response.md)
- [tls](../objects/tls.md)

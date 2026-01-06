# Airborne Broadcast Activity (8002)

Airborne Broadcast Activity events report the activity of any aircraft or unmanned system as reported and tracked by Automatic Dependent Surveillance - Broadcast (ADS-B) receivers. Based on the ADS-B standards described in <a target='_blank' href='https://www.ecfr.gov/current/title-14/chapter-I/subchapter-F/part-91#91.225'>Code of Federal Regulations (CFR) Title 14 Chapter I Subchapter F Part 91</a> and in other general Federal Aviation Administration (FAA) supplemental orders and guidance described <a target='_blank' href='https://www.faa.gov/about/office_org/headquarters_offices/avs/offices/afx/afs/afs400/afs410/ads-b'>here</a>.

**Category**: Unmanned Systems
**Extends**: unmanned_systems
**UID**: 8002

## Profiles

`cloud`, `datetime`, `host`, `osint`, `security_control`, `data_classification`, `container`, `linux/linux_users`

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
| `unmanned_aerial_system` | object (unmanned_aerial_system) |
| `unmanned_system_operator` | object (user) |

### Recommended

| Attribute | Type |
|-----------|------|
| `action_id` | integer_t |
| `aircraft` | object (aircraft) |
| `confidence_id` | integer_t |
| `connection_info` | object (network_connection_info) |
| `device` | object (device) |
| `disposition_id` | integer_t |
| `is_alert` | boolean_t |
| `message` | string_t |
| `observables` | object (observable) |
| `protocol_name` | string_t |
| `proxy_endpoint` | object (network_proxy) |
| `status` | string_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `unmanned_system_operating_area` | object (unmanned_system_operating_area) |

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
| `dst_endpoint` | object (network_endpoint) |
| `duration` | long_t |
| `end_time` | timestamp_t |
| `end_time_dt` | datetime_t |
| `enrichments` | object (enrichment) |
| `firewall_rule` | object (firewall_rule) |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `policy` | object (policy) |
| `raw_data` | string_t |
| `raw_data_hash` | object (fingerprint) |
| `raw_data_size` | long_t |
| `risk_details` | string_t |
| `risk_level` | string_t |
| `risk_level_id` | integer_t |
| `risk_score` | integer_t |
| `rssi` | integer_t |
| `severity` | string_t |
| `src_endpoint` | object (network_endpoint) |
| `start_time` | timestamp_t |
| `start_time_dt` | datetime_t |
| `time_dt` | datetime_t |
| `tls` | object (tls) |
| `traffic` | object (network_traffic) |
| `type_name` | string_t |
| `unmapped` | object (object) |

## Objects Used

- [actor](../objects/actor.md)
- [aircraft](../objects/aircraft.md)
- [api](../objects/api.md)
- [attack](../objects/attack.md)
- [authorization](../objects/authorization.md)
- [cloud](../objects/cloud.md)
- [device](../objects/device.md)
- [enrichment](../objects/enrichment.md)
- [fingerprint](../objects/fingerprint.md)
- [firewall_rule](../objects/firewall_rule.md)
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
- [unmanned_aerial_system](../objects/unmanned_aerial_system.md)
- [unmanned_system_operating_area](../objects/unmanned_system_operating_area.md)
- [user](../objects/user.md)

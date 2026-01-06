# Compliance Finding (2003)

Compliance Finding events describe results of evaluations performed against resources, to check compliance with various Industry Frameworks or Security Standards such as `NIST SP 800-53, CIS AWS Foundations Benchmark v1.4.0, ISO/IEC 27001` etc. Note: if the event producer is a security control, the `security_control` profile should be applied and its `attacks` information, if present, should be duplicated into the `finding_info` object.  <strong>Note: </strong>If the Finding is an incident, i.e. requires incident workflow, also apply the `incident` profile or aggregate this finding into an `Incident Finding`.

**Category**: Findings
**Extends**: finding
**UID**: 2003

## Profiles

`cloud`, `datetime`, `host`, `osint`, `security_control`, `incident`, `data_classification`, `container`, `linux/linux_users`

## Attributes

### Required

| Attribute | Type |
|-----------|------|
| `activity_id` | integer_t |
| `category_uid` | integer_t |
| `class_uid` | integer_t |
| `cloud` | object (cloud) |
| `compliance` | object (compliance) |
| `finding_info` | object (finding_info) |
| `metadata` | object (metadata) |
| `osint` | object (osint) |
| `severity_id` | integer_t |
| `time` | timestamp_t |
| `type_uid` | long_t |

### Recommended

| Attribute | Type |
|-----------|------|
| `action_id` | integer_t |
| `confidence_id` | integer_t |
| `disposition_id` | integer_t |
| `impact` | string_t |
| `impact_id` | integer_t |
| `impact_score` | integer_t |
| `is_alert` | boolean_t |
| `message` | string_t |
| `observables` | object (observable) |
| `priority_id` | integer_t |
| `remediation` | object (remediation) |
| `resource` | object (resource_details) |
| `resources` | object (resource_details) |
| `src_url` | url_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `verdict` | string_t |
| `verdict_id` | integer_t |

### Optional

| Attribute | Type |
|-----------|------|
| `action` | string_t |
| `activity_name` | string_t |
| `actor` | object (actor) |
| `api` | object (api) |
| `assignee` | object (user) |
| `assignee_group` | object (group) |
| `attacks` | object (attack) |
| `authorizations` | object (authorization) |
| `category_name` | string_t |
| `class_name` | string_t |
| `comment` | string_t |
| `confidence` | string_t |
| `confidence_score` | integer_t |
| `count` | integer_t |
| `device` | object (device) |
| `disposition` | string_t |
| `duration` | long_t |
| `end_time` | timestamp_t |
| `end_time_dt` | datetime_t |
| `enrichments` | object (enrichment) |
| `evidences` | object (evidences) |
| `firewall_rule` | object (firewall_rule) |
| `is_suspected_breach` | boolean_t |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `policy` | object (policy) |
| `priority` | string_t |
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
| `status` | string_t |
| `ticket` | object (ticket) |
| `tickets` | object (ticket) |
| `time_dt` | datetime_t |
| `type_name` | string_t |
| `unmapped` | object (object) |
| `vendor_attributes` | object (vendor_attributes) |

## Objects Used

- [actor](../objects/actor.md)
- [api](../objects/api.md)
- [attack](../objects/attack.md)
- [authorization](../objects/authorization.md)
- [cloud](../objects/cloud.md)
- [compliance](../objects/compliance.md)
- [device](../objects/device.md)
- [enrichment](../objects/enrichment.md)
- [evidences](../objects/evidences.md)
- [finding_info](../objects/finding_info.md)
- [fingerprint](../objects/fingerprint.md)
- [firewall_rule](../objects/firewall_rule.md)
- [group](../objects/group.md)
- [malware](../objects/malware.md)
- [malware_scan_info](../objects/malware_scan_info.md)
- [metadata](../objects/metadata.md)
- [object](../objects/object.md)
- [observable](../objects/observable.md)
- [osint](../objects/osint.md)
- [policy](../objects/policy.md)
- [remediation](../objects/remediation.md)
- [resource_details](../objects/resource_details.md)
- [ticket](../objects/ticket.md)
- [user](../objects/user.md)
- [vendor_attributes](../objects/vendor_attributes.md)

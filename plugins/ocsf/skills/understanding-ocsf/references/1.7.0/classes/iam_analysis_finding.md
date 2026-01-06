# IAM Analysis Finding (2008)

This finding represents an IAM analysis result, which evaluates IAM policies, access patterns, and IAM configurations for potential security risks. The analysis can focus on either an identity (user, role, service account) or a resource to assess permissions, access patterns, and security posture within the IAM domain.  <strong>Note:</strong> Use `permission_analysis_results` for identity-centric analysis (evaluating what an identity can do) and `access_analysis_result` for resource-centric analysis (evaluating who can access a resource). These complement each other for comprehensive IAM security assessment. <strong>Note:</strong> If the Finding is an incident, i.e. requires incident workflow, also apply the `incident` profile or aggregate this finding into an `Incident Finding`.

**Category**: Findings
**Extends**: finding
**UID**: 2008

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
| `applications` | object (application) |
| `confidence_id` | integer_t |
| `disposition_id` | integer_t |
| `identity_activity_metrics` | object (identity_activity_metrics) |
| `impact` | string_t |
| `impact_id` | integer_t |
| `impact_score` | integer_t |
| `is_alert` | boolean_t |
| `message` | string_t |
| `observables` | object (observable) |
| `permission_analysis_results` | object (permission_analysis_result) |
| `priority_id` | integer_t |
| `resources` | object (resource_details) |
| `src_url` | url_t |
| `status_code` | string_t |
| `status_detail` | string_t |
| `status_id` | integer_t |
| `timezone_offset` | integer_t |
| `user` | object (user) |
| `verdict` | string_t |
| `verdict_id` | integer_t |

### Optional

| Attribute | Type |
|-----------|------|
| `access_analysis_result` | object (access_analysis_result) |
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
| `firewall_rule` | object (firewall_rule) |
| `is_suspected_breach` | boolean_t |
| `malware` | object (malware) |
| `malware_scan_info` | object (malware_scan_info) |
| `policy` | object (policy) |
| `priority` | string_t |
| `raw_data` | string_t |
| `raw_data_hash` | object (fingerprint) |
| `raw_data_size` | long_t |
| `remediation` | object (remediation) |
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

- [access_analysis_result](../objects/access_analysis_result.md)
- [actor](../objects/actor.md)
- [api](../objects/api.md)
- [application](../objects/application.md)
- [attack](../objects/attack.md)
- [authorization](../objects/authorization.md)
- [cloud](../objects/cloud.md)
- [device](../objects/device.md)
- [enrichment](../objects/enrichment.md)
- [finding_info](../objects/finding_info.md)
- [fingerprint](../objects/fingerprint.md)
- [firewall_rule](../objects/firewall_rule.md)
- [group](../objects/group.md)
- [identity_activity_metrics](../objects/identity_activity_metrics.md)
- [malware](../objects/malware.md)
- [malware_scan_info](../objects/malware_scan_info.md)
- [metadata](../objects/metadata.md)
- [object](../objects/object.md)
- [observable](../objects/observable.md)
- [osint](../objects/osint.md)
- [permission_analysis_result](../objects/permission_analysis_result.md)
- [policy](../objects/policy.md)
- [remediation](../objects/remediation.md)
- [resource_details](../objects/resource_details.md)
- [ticket](../objects/ticket.md)
- [user](../objects/user.md)
- [vendor_attributes](../objects/vendor_attributes.md)

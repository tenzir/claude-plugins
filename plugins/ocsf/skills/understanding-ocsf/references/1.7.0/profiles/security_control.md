# Security Control

The attributes including disposition that represent the outcome of a security control including but not limited to access control, malware or policy violation, network proxy, intrusion detection, firewall, or data control.  The profile is intended to augment activities or findings with an outcome when a security control has observed or intervened. If the control detected a security violation, and the `disposition_id` or `action_id` is an alertable outcome or action, the `is_alert` flag may be set to `true`.

## Attributes

| Attribute | Type | Requirement | Description |
|-----------|------|-------------|-------------|
| `action` | string_t | optional | Action |
| `action_id` | integer_t | recommended | Action ID |
| `attacks` | object (attack) | optional | MITRE ATT&CK® and ATLAS™ Details |
| `authorizations` | object (authorization) | optional | Authorization Information |
| `confidence` | string_t | optional | Confidence |
| `confidence_id` | integer_t | recommended | Confidence ID |
| `confidence_score` | integer_t | optional | Confidence Score |
| `disposition` | string_t | optional | Disposition |
| `disposition_id` | integer_t | recommended | Disposition ID |
| `firewall_rule` | object (firewall_rule) | optional | Firewall Rule |
| `is_alert` | boolean_t | recommended | Alert |
| `malware` | object (malware) | optional | Malware |
| `malware_scan_info` | object (malware_scan_info) | optional | Malware Scan Info |
| `policy` | object (policy) | optional | Policy |
| `risk_details` | string_t | optional | Risk Details |
| `risk_level` | string_t | optional | Risk Level |
| `risk_level_id` | integer_t | optional | Risk Level ID |
| `risk_score` | integer_t | optional | Risk Score |

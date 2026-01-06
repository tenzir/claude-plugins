# Ticket

The Ticket object represents ticket in the customer's IT Service Management (ITSM) systems like ServiceNow, Jira, etc.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `src_url` | url_t | recommended |
| `status` | string_t | optional |
| `status_details` | string_t | optional |
| `status_id` | integer_t | optional |
| `title` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `src_url`, `uid`

## Used By

- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [incident_finding](../classes/incident_finding.md)
- [incident_finding](../classes/incident_finding.md)
- [vulnerability_finding](../classes/vulnerability_finding.md)
- [vulnerability_finding](../classes/vulnerability_finding.md)

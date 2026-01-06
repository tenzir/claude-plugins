# Compliance

The Compliance object contains information about Industry and Regulatory Framework standards, controls and requirements or details about custom assessments utilized in a compliance evaluation. Standards define broad security frameworks, controls represent specific security requirements within those frameworks, and checks are the testable verification points used to determine if controls are properly implemented.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `assessments` | object (assessment) | optional |
| `category` | string_t | optional |
| `checks` | object (check) | optional |
| `compliance_references` | object (kb_article) | optional |
| `compliance_standards` | object (kb_article) | optional |
| `control` | string_t | recommended |
| `control_parameters` | object (key_value_object) | optional |
| `desc` | string_t | optional |
| `requirements` | string_t | optional |
| `standards` | string_t | recommended |
| `status` | string_t | recommended |
| `status_code` | string_t | optional |
| `status_detail` | string_t | optional |
| `status_details` | string_t | optional |
| `status_id` | integer_t | recommended |

## Used By

- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [security_finding](../classes/security_finding.md)

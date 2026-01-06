# Vendor Attributes

The Vendor Attributes object can be used to represent values of attributes populated by the Vendor/Finding Provider. It can help distinguish between the vendor-provided values and consumer-updated values, of key attributes like `severity_id`. The original finding producer should not populate this object. It should be populated by consuming systems that support data mutability.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `severity` | string_t | optional |
| `severity_id` | integer_t | optional |

## Used By

- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [data_security_finding](../classes/data_security_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [incident_finding](../classes/incident_finding.md)
- [vulnerability_finding](../classes/vulnerability_finding.md)

# Remediation

The Remediation object describes the recommended remediation steps to address identified issue(s).

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `cis_controls` | object (cis_control) | optional |
| `desc` | string_t | required |
| `kb_article_list` | object (kb_article) | optional |
| `kb_articles` | string_t | optional |
| `references` | string_t | optional |

## Used By

- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [compliance_finding](../classes/compliance_finding.md)
- [detection_finding](../classes/detection_finding.md)
- [file_remediation_activity](../classes/file_remediation_activity.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)
- [network_remediation_activity](../classes/network_remediation_activity.md)
- [process_remediation_activity](../classes/process_remediation_activity.md)
- [remediation_activity](../classes/remediation_activity.md)

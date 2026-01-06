# Application

An Application describes the details for an inventoried application as reported by an Application Security tool or other Developer-centric tooling. Applications can be defined as Kubernetes resources, Containerized resources, or application hosting-specific cloud sources such as AWS Elastic BeanStalk, AWS Lightsail, or Azure Logic Apps.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `criticality` | string_t | optional |
| `data` | json_t | optional |
| `desc` | string_t | optional |
| `group` | object (group) | optional |
| `hostname` | hostname_t | optional |
| `labels` | string_t | optional |
| `name` | string_t | recommended |
| `owner` | object (user) | recommended |
| `region` | string_t | optional |
| `resource_relationship` | object (graph) | optional |
| `risk_level` | string_t | optional |
| `risk_level_id` | integer_t | optional |
| `risk_score` | integer_t | optional |
| `sbom` | object (sbom) | optional |
| `tags` | object (key_value_object) | optional |
| `type` | string_t | optional |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `url` | object (url) | optional |
| `version` | string_t | optional |

## Constraints

At least one of: `uid`, `name`

## Used By

- [application_security_posture_finding](../classes/application_security_posture_finding.md)
- [iam_analysis_finding](../classes/iam_analysis_finding.md)

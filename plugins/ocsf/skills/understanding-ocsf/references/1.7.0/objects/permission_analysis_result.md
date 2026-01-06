# Permission Analysis Result

The Permission Analysis object describes analysis results of permissions, policies directly associated with an identity (user, role, or service account). This evaluates what permissions an identity has been granted through attached policies, which privileges are actively used versus unused, and identifies potential over-privileged access. Use this for identity-centric security assessments such as privilege audits, dormant permission discovery, and least-privilege compliance analysis.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `condition_keys` | object (key_value_object) | optional |
| `granted_privileges` | string_t | optional |
| `policy` | object (policy) | recommended |
| `unused_privileges_count` | integer_t | optional |
| `unused_services_count` | integer_t | optional |

## Used By

- [iam_analysis_finding](../classes/iam_analysis_finding.md)

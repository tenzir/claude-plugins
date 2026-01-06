# Access Analysis Result

The Access Analysis Result object describes access relationships and pathways between identities, resources, focusing on who can access what and through which mechanisms. This evaluates access levels (read/write/admin), access types (direct, cross-account, public, federated), and the conditions under which access is granted. Use this for resource-centric security assessments such as external access discovery, public exposure analysis, etc.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `access_level` | string_t | recommended |
| `access_type` | string_t | optional |
| `accessors` | object (user) | required |
| `additional_restrictions` | object (additional_restriction) | optional |
| `condition_keys` | object (key_value_object) | optional |
| `granted_privileges` | string_t | optional |

## Used By

- [iam_analysis_finding](../classes/iam_analysis_finding.md)

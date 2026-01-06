# Identity Activity Metrics

The Identity Activity Metrics object captures usage patterns, authentication activity, credential usage and other metrics for identities across cloud and on-premises environments. Example identities include AWS IAM Users, Roles, Azure AD Principals, GCP Service Accounts, on-premises Active Directory accounts.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `first_seen_time` | timestamp_t | optional |
| `first_seen_time_dt` | datetime_t | optional |
| `last_authentication_time` | timestamp_t | optional |
| `last_authentication_time_dt` | datetime_t | optional |
| `last_seen_time` | timestamp_t | recommended |
| `last_seen_time_dt` | datetime_t | optional |
| `password_last_used_time` | timestamp_t | optional |
| `password_last_used_time_dt` | datetime_t | optional |
| `programmatic_credentials` | object (programmatic_credential) | optional |

## Used By

- [iam_analysis_finding](../classes/iam_analysis_finding.md)

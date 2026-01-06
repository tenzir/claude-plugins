# Email Authentication

The Email Authentication object describes the Sender Policy Framework (SPF), DomainKeys Identified Mail (DKIM) and Domain-based Message Authentication, Reporting and Conformance (DMARC) attributes of an email.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `dkim` | string_t | recommended |
| `dkim_domain` | string_t | recommended |
| `dkim_signature` | string_t | recommended |
| `dmarc` | string_t | recommended |
| `dmarc_override` | string_t | recommended |
| `dmarc_policy` | string_t | recommended |
| `spf` | string_t | recommended |

## Used By

- [email_activity](../classes/email_activity.md)

# Organization

The Organization object describes characteristics of an organization or company and its division if any. Additionally, it also describes cloud and Software-as-a-Service (SaaS) logical hierarchies such as AWS Organizations, Google Cloud Organizations, Oracle Cloud Tenancies, and similar constructs.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `ou_name` | string_t | recommended |
| `ou_uid` | string_t | optional |
| `uid` | string_t | recommended |

## Constraints

At least one of: `name`, `uid`

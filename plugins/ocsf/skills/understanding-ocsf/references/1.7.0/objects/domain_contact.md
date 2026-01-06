# Domain Contact

The contact information related to a domain registration, e.g., registrant, administrator, abuse, billing, or technical contact.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `email_addr` | email_t | recommended |
| `location` | object (location) | recommended |
| `name` | string_t | optional |
| `phone_number` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `uid` | string_t | optional |

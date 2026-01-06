# WHOIS

The resources of a WHOIS record for a given domain. This can include domain names, IP address blocks, autonomous system information, and/or contact and registration information for a domain.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `autonomous_system` | object (autonomous_system) | optional |
| `created_time` | timestamp_t | recommended |
| `created_time_dt` | datetime_t | optional |
| `dnssec_status` | string_t | optional |
| `dnssec_status_id` | integer_t | recommended |
| `domain` | string_t | recommended |
| `domain_contacts` | object (domain_contact) | recommended |
| `email_addr` | email_t | optional |
| `isp` | string_t | optional |
| `isp_org` | string_t | optional |
| `last_seen_time` | timestamp_t | recommended |
| `last_seen_time_dt` | datetime_t | optional |
| `name_servers` | string_t | recommended |
| `phone_number` | string_t | optional |
| `registrar` | string_t | recommended |
| `status` | string_t | recommended |
| `subdomains` | string_t | optional |
| `subnet` | subnet_t | optional |

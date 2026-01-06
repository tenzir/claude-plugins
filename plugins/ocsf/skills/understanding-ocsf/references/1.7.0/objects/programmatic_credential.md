# Programmatic Credential

The Programmatic Credential object describes service-specific credentials used for direct API access and system integration. These credentials are typically issued by individual services or platforms for accessing their APIs and resources, focusing on credential lifecycle management and usage tracking. Examples include API keys, service account keys, client certificates, and vendor-specific access tokens.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `last_used_time` | timestamp_t | optional |
| `last_used_time_dt` | datetime_t | optional |
| `type` | string_t | recommended |
| `uid` | string_t | required |

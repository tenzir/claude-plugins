# Digital Signature

The Digital Signature object contains information about the cryptographic mechanism used to verify the authenticity, integrity, and origin of the file or application.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `algorithm` | string_t | optional |
| `algorithm_id` | integer_t | required |
| `certificate` | object (certificate) | recommended |
| `created_time` | timestamp_t | optional |
| `created_time_dt` | datetime_t | optional |
| `developer_uid` | string_t | optional |
| `digest` | object (fingerprint) | optional |
| `state` | string_t | optional |
| `state_id` | integer_t | optional |

# HTTP Cookie

The HTTP Cookie object, also known as a web cookie or browser cookie, contains details and values pertaining to a small piece of data that a server sends to a user's web browser. This data is then stored by the browser and sent back to the server with subsequent requests, allowing the server to remember and track certain information about the user's browsing session or preferences.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `domain` | string_t | optional |
| `expiration_time` | timestamp_t | optional |
| `expiration_time_dt` | datetime_t | optional |
| `http_only` | boolean_t | optional |
| `is_http_only` | boolean_t | optional |
| `is_secure` | boolean_t | optional |
| `name` | string_t | required |
| `path` | string_t | optional |
| `samesite` | string_t | optional |
| `secure` | boolean_t | optional |
| `value` | string_t | required |

## Used By

- [http_activity](../classes/http_activity.md)

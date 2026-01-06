# HTTP Request

The HTTP Request object represents the attributes of a request made to a web server. It encapsulates the details and metadata associated with an HTTP request, including the request method, headers, URL, query parameters, body content, and other relevant information.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `args` | string_t | optional |
| `body_length` | integer_t | optional |
| `http_headers` | object (http_header) | recommended |
| `http_method` | string_t | recommended |
| `length` | integer_t | optional |
| `referrer` | string_t | optional |
| `uid` | string_t | optional |
| `url` | object (url) | recommended |
| `user_agent` | string_t | recommended |
| `version` | string_t | recommended |
| `x_forwarded_for` | ip_t | optional |

## Used By

- [account_change](../classes/account_change.md)
- [api_activity](../classes/api_activity.md)
- [authentication](../classes/authentication.md)
- [authorize_session](../classes/authorize_session.md)
- [datastore_activity](../classes/datastore_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [entity_management](../classes/entity_management.md)
- [file_hosting](../classes/file_hosting.md)
- [ftp_activity](../classes/ftp_activity.md)
- [group_management](../classes/group_management.md)
- [http_activity](../classes/http_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)
- [ssh_activity](../classes/ssh_activity.md)
- [tunnel_activity](../classes/tunnel_activity.md)
- ... (5 more)

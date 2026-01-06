# HTTP Response

The HTTP Response object contains detailed information about the response sent from a web server to the requester. It encompasses attributes and metadata that describe the response status, headers, body content, and other relevant information.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `body_length` | integer_t | optional |
| `code` | integer_t | required |
| `content_type` | string_t | optional |
| `http_headers` | object (http_header) | recommended |
| `latency` | integer_t | optional |
| `length` | integer_t | optional |
| `message` | string_t | optional |
| `status` | string_t | optional |

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

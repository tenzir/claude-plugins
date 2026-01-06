# JA4+ Fingerprint

The JA4+ fingerprint object provides detailed fingerprint information about various aspects of network traffic which is both machine and human readable.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `section_a` | string_t | optional |
| `section_b` | string_t | optional |
| `section_c` | string_t | optional |
| `section_d` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | required |
| `value` | string_t | required |

## Used By

- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)
- [ssh_activity](../classes/ssh_activity.md)
- [tunnel_activity](../classes/tunnel_activity.md)

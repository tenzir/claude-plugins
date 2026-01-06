# Transport Layer Security (TLS)

The Transport Layer Security (TLS) object describes the negotiated TLS protocol used for secure communications over an establish network connection.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `alert` | integer_t | optional |
| `certificate` | object (certificate) | recommended |
| `certificate_chain` | string_t | recommended |
| `cipher` | string_t | recommended |
| `client_ciphers` | string_t | recommended |
| `extension_list` | object (tls_extension) | optional |
| `handshake_dur` | integer_t | optional |
| `ja3_hash` | object (fingerprint) | recommended |
| `ja3s_hash` | object (fingerprint) | recommended |
| `key_length` | integer_t | optional |
| `sans` | object (san) | optional |
| `server_ciphers` | string_t | optional |
| `sni` | string_t | recommended |
| `tls_extension_list` | object (tls_extension) | optional |
| `version` | string_t | required |

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [ntp_activity](../classes/ntp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [rdp_activity](../classes/rdp_activity.md)
- [smb_activity](../classes/smb_activity.md)
- [smb_activity](../classes/smb_activity.md)
- ... (8 more)

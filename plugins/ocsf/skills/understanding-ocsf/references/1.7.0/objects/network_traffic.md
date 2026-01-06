# Network Traffic

The Network Traffic object describes characteristics of network traffic over a time period. The metrics represent network data transferred between source and destination during an observation window.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `bytes` | long_t | recommended |
| `bytes_in` | long_t | optional |
| `bytes_missed` | long_t | optional |
| `bytes_out` | long_t | optional |
| `chunks` | long_t | optional |
| `chunks_in` | long_t | optional |
| `chunks_out` | long_t | optional |
| `end_time` | timestamp_t | optional |
| `end_time_dt` | datetime_t | optional |
| `packets` | long_t | recommended |
| `packets_in` | long_t | optional |
| `packets_out` | long_t | optional |
| `start_time` | timestamp_t | optional |
| `start_time_dt` | datetime_t | optional |
| `timespan` | object (timespan) | optional |

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dhcp_activity](../classes/dhcp_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [dns_activity](../classes/dns_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [ftp_activity](../classes/ftp_activity.md)
- [http_activity](../classes/http_activity.md)
- [http_activity](../classes/http_activity.md)
- [http_activity](../classes/http_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_activity](../classes/network_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- [network_file_activity](../classes/network_file_activity.md)
- ... (17 more)

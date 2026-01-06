# Network Proxy

The attributes that identify network proxy attributes.

## Attributes

| Attribute | Type | Requirement | Description |
|-----------|------|-------------|-------------|
| `proxy_connection_info` | object (network_connection_info) | recommended | Proxy Connection Info |
| `proxy_endpoint` | object (network_proxy) | optional | Proxy Endpoint |
| `proxy_http_request` | object (http_request) | optional | Proxy HTTP Request |
| `proxy_http_response` | object (http_response) | optional | Proxy HTTP Response |
| `proxy_tls` | object (tls) | recommended | Proxy TLS |
| `proxy_traffic` | object (network_traffic) | recommended | Proxy Traffic |

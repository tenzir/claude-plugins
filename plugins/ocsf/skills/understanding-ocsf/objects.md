# Objects

Objects are collections of contextually related attributes that represent
entities. They are the reusable building blocks embedded within event classes.

## Common Objects

These objects appear frequently across event classes:

| Object             | Description                                               |
| ------------------ | --------------------------------------------------------- |
| `actor`            | User, role, application, or process that initiated action |
| `device`           | Addressable computer system or host                       |
| `user`             | Person or service account                                 |
| `process`          | Running program with PID, command line, parent            |
| `file`             | File with path, name, hashes, permissions                 |
| `network_endpoint` | Network address with IP, port, protocol                   |
| `cloud`            | Cloud environment context (provider, account, region)     |
| `container`        | Container instance with image, runtime, orchestrator      |
| `metadata`         | Event metadata (product, version, log details)            |
| `observable`       | Indicator with type, value, reputation                    |

## Object Categories

### Identity & Access (15 objects)

`account`, `actor`, `auth_factor`, `authentication_token`, `authorization`,
`group`, `idp`, `ldap_person`, `organization`, `policy`, `session`,
`sso`, `ticket`, `trait`, `user`

### Process & System (18 objects)

`agent`, `application`, `container`, `device`, `device_hw_info`, `display`,
`environment_variable`, `image`, `kernel`, `kernel_driver`, `keyboard_info`,
`module`, `os`, `peripheral_device`, `process`, `process_entity`, `service`,
`startup_item`

### Network (18 objects)

`autonomous_system`, `dns_answer`, `dns_query`, `endpoint`,
`endpoint_connection`, `firewall_rule`, `http_cookie`, `http_header`,
`http_request`, `http_response`, `load_balancer`, `network_connection_info`,
`network_endpoint`, `network_interface`, `network_proxy`, `network_traffic`,
`tls`, `tls_extension`

### File & Data (14 objects)

`data_classification`, `data_security`, `database`, `databucket`,
`digital_signature`, `encryption_details`, `file`, `fingerprint`, `hassh`,
`ja4_fingerprint`, `package`, `sbom`, `script`, `software_component`

### Security & Compliance (28 objects)

`analytic`, `anomaly`, `anomaly_analysis`, `assessment`, `attack`, `baseline`,
`campaign`, `check`, `cis_benchmark`, `cis_benchmark_result`, `cis_control`,
`cis_csc`, `compliance`, `cve`, `cvss`, `cwe`, `d3f_tactic`, `d3f_technique`,
`d3fend`, `finding`, `finding_info`, `kill_chain_phase`, `malware`,
`malware_scan_info`, `mitigation`, `osint`, `rule`, `vulnerability`

### Cloud & Infrastructure (11 objects)

`api`, `cloud`, `function_invocation`, `job`, `managed_entity`, `product`,
`reporter`, `request`, `resource_details`, `response`, `web_resource`

### Observability (12 objects)

`enrichment`, `evidences`, `graph`, `logger`, `metric`, `node`, `observable`,
`observation`, `occurrence_details`, `span`, `trace`, `transformation_info`

### Specialized (14 objects)

`aircraft`, `certificate`, `dce_rpc`, `domain_contact`, `email`, `email_auth`,
`location`, `remediation`, `reputation`, `rpc_interface`, `san`, `scim`,
`threat_actor`, `unmanned_aerial_system`

### Windows-specific (4 objects)

`win/reg_key`, `win/reg_value`, `win/win_resource`, `win/win_service`

## Object Structure

Each object definition includes:

- **Name**: Unique identifier (snake_case)
- **Description**: What the object represents
- **Attributes**: Fields with types and requirements
- **Constraints**: Validation rules (e.g., "at least one of X or Y")

## Cross-references

Objects reference other objects. For example:

- `actor` contains `user`, `process`, `session`
- `process` contains `file` (for executable), `user` (owner)
- `finding` contains `attack`, `evidences`, `remediation`

Detailed per-object documentation is in `references/<version>/objects/`.
See [SKILL.md](./SKILL.md) for available versions.

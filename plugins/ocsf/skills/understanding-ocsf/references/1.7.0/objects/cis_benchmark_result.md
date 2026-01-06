# CIS Benchmark Result

The CIS Benchmark Result object contains information as defined by the Center for Internet Security ( [https://www.cisecurity.org/cis-benchmarks/](CIS) benchmark result. CIS Benchmarks are a collection of best practices for securely configuring IT systems, software, networks, and cloud infrastructure.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `desc` | string_t | optional |
| `name` | string_t | required |
| `remediation` | object (remediation) | optional |
| `rule` | object (rule) | optional |

## Used By

- [config_state](../classes/config_state.md)

# Agent

An Agent (also known as a Sensor) is typically installed on an Operating System (OS) and serves as a specialized software component that can be designed to monitor, detect, collect, archive, or take action. These activities and possible actions are defined by the upstream system controlling the Agent and its intended purpose. For instance, an Agent can include Endpoint Detection & Response (EDR) agents, backup/disaster recovery sensors, Application Performance Monitoring or profiling sensors, and similar software.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `name` | string_t | recommended |
| `policies` | object (policy) | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `vendor_name` | string_t | optional |
| `version` | string_t | optional |

## Constraints

At least one of: `uid`, `name`

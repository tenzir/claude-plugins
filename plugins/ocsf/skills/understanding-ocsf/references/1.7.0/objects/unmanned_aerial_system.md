# Unmanned Aerial System

The Unmanned Aerial System object describes the characteristics, Position Location Information (PLI), and other metadata of Unmanned Aerial Systems (UAS) and other unmanned and drone systems used in Remote ID. Remote ID is defined in the Standard Specification for Remote ID and Tracking (ASTM Designation: F3411-22a)  [https://cdn.standards.iteh.ai/samples/112830/71297057ac42432880a203654f213709/ASTM-F3411-22a.pdf](ASTM F3411-22a.

**Extends**: aircraft

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `hw_info` | object (device_hw_info) | optional |
| `location` | object (location) | recommended |
| `model` | string_t | optional |
| `name` | string_t | optional |
| `serial_number` | string_t | recommended |
| `speed` | string_t | optional |
| `speed_accuracy` | string_t | optional |
| `track_direction` | string_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | recommended |
| `uuid` | uuid_t | recommended |
| `vertical_speed` | string_t | optional |

## Constraints

At least one of: `name`, `serial_number`, `uid`, `uid_alt`

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)

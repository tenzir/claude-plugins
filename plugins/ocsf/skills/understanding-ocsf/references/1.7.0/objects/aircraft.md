# Aircraft

The Aircraft object represents any aircraft or otherwise airborne asset such as an unmanned system, airplane, balloon, spacecraft, or otherwise. The Aircraft object is intended to normalized data captured or otherwise logged from active radar, passive radar, multi-spectral systems, or the Automatic Dependant Broadcast - Surveillance (ADS-B), and/or Mode S systems.

**Extends**: _entity

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `location` | object (location) | recommended |
| `model` | string_t | optional |
| `name` | string_t | recommended |
| `serial_number` | string_t | optional |
| `speed` | string_t | optional |
| `speed_accuracy` | string_t | optional |
| `track_direction` | string_t | optional |
| `uid` | string_t | recommended |
| `uid_alt` | string_t | optional |
| `vertical_speed` | string_t | optional |

## Constraints

At least one of: `name`, `serial_number`, `uid`, `uid_alt`

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)

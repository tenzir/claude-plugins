# Unmanned System Operating Area

The Unmanned System Operating Area object describes details about a precise area of operations for a UAS flight or mission.

**Extends**: location

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `aerial_height` | string_t | optional |
| `altitude_ceiling` | string_t | optional |
| `altitude_floor` | string_t | optional |
| `city` | string_t | recommended |
| `continent` | string_t | recommended |
| `coordinates` | float_t | optional |
| `count` | integer_t | recommended |
| `country` | string_t | recommended |
| `desc` | string_t | optional |
| `end_time` | timestamp_t | optional |
| `end_time_dt` | datetime_t | optional |
| `geodetic_altitude` | string_t | optional |
| `geodetic_vertical_accuracy` | string_t | optional |
| `geohash` | string_t | optional |
| `horizontal_accuracy` | string_t | optional |
| `is_on_premises` | boolean_t | optional |
| `isp` | string_t | optional |
| `lat` | float_t | optional |
| `locations` | object (location) | recommended |
| `long` | float_t | optional |
| `postal_code` | string_t | optional |
| `pressure_altitude` | string_t | optional |
| `provider` | string_t | optional |
| `radius` | string_t | optional |
| `region` | string_t | optional |
| `start_time` | timestamp_t | optional |
| `start_time_dt` | datetime_t | optional |
| `type` | string_t | optional |
| `type_id` | integer_t | recommended |

## Constraints

At least one of: `city`, `country`, `postal_code`, `region`

## Used By

- [airborne_broadcast_activity](../classes/airborne_broadcast_activity.md)
- [drone_flights_activity](../classes/drone_flights_activity.md)

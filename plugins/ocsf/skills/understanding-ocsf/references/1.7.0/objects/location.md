# Geo Location

The Geo Location object describes a geographical location, usually associated with an IP address.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `aerial_height` | string_t | optional |
| `city` | string_t | recommended |
| `continent` | string_t | recommended |
| `coordinates` | float_t | optional |
| `country` | string_t | recommended |
| `desc` | string_t | optional |
| `geodetic_altitude` | string_t | optional |
| `geodetic_vertical_accuracy` | string_t | optional |
| `geohash` | string_t | optional |
| `horizontal_accuracy` | string_t | optional |
| `is_on_premises` | boolean_t | optional |
| `isp` | string_t | optional |
| `lat` | float_t | optional |
| `long` | float_t | optional |
| `postal_code` | string_t | optional |
| `pressure_altitude` | string_t | optional |
| `provider` | string_t | optional |
| `region` | string_t | optional |

## Constraints

At least one of: `city`, `country`, `postal_code`, `region`

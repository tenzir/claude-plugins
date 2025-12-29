# Attributes

Attributes are the foundation of OCSF - named data types (scalar or complex)
that can be validated and processed consistently.

> The attribute type system and naming conventions documented here are stable
> across OCSF versions.

## Attribute Types

OCSF defines 24 primitive types:

| Type             | Description                        |
| ---------------- | ---------------------------------- |
| `boolean_t`      | True/false value                   |
| `bytestring_t`   | Base64-encoded binary data         |
| `datetime_t`     | RFC 3339 formatted datetime string |
| `email_t`        | Email address                      |
| `file_hash_t`    | File hash value                    |
| `file_name_t`    | File name without path             |
| `file_path_t`    | Full or partial file path          |
| `float_t`        | Floating-point number              |
| `hostname_t`     | Hostname                           |
| `integer_t`      | 32-bit signed integer              |
| `ip_t`           | IPv4 or IPv6 address               |
| `json_t`         | Arbitrary JSON data                |
| `long_t`         | 64-bit signed integer              |
| `mac_t`          | MAC address                        |
| `port_t`         | TCP/UDP port number (0-65535)      |
| `process_name_t` | Process name                       |
| `reg_key_path_t` | Windows registry key path          |
| `resource_uid_t` | Cloud resource unique identifier   |
| `string_t`       | Unicode string                     |
| `subnet_t`       | IP subnet in CIDR notation         |
| `timestamp_t`    | Unix epoch milliseconds            |
| `url_t`          | URL                                |
| `username_t`     | Username                           |
| `uuid_t`         | UUID                               |

Additionally, `object_t` references a complex object type.

## Naming Conventions

Attribute names follow consistent suffixes that indicate their purpose:

| Suffix   | Meaning                                  | Example         |
| -------- | ---------------------------------------- | --------------- |
| `_id`    | Normalized enumeration ID (integer)      | `activity_id`   |
| `_uid`   | Unique identifier (opaque string)        | `class_uid`     |
| `_name`  | Human-readable name                      | `activity_name` |
| `_time`  | Timestamp (milliseconds since epoch)     | `start_time`    |
| `_dt`    | Datetime string (RFC 3339)               | `start_time_dt` |
| `_count` | Count or quantity                        | `attempt_count` |
| `_code`  | Numeric code (error codes, status codes) | `status_code`   |
| `_type`  | Type classification                      | `account_type`  |
| `_path`  | File system or registry path             | `file_path`     |
| `_hash`  | Hash value                               | `file_hash`     |

## Requirement Levels

Every attribute has a requirement level:

| Level         | Meaning                                           |
| ------------- | ------------------------------------------------- |
| `required`    | Must be present for the event to be valid         |
| `recommended` | Should be present when the data is available      |
| `optional`    | Include when meaningful; absence implies no value |

## Attribute Groups

Attributes within a class are organized into groups:

| Group            | Purpose                                        |
| ---------------- | ---------------------------------------------- |
| `classification` | Event classification (class_uid, category_uid) |
| `occurrence`     | When it happened (time, timezone)              |
| `context`        | Additional context (metadata, observables)     |
| `primary`        | Core event details specific to this class      |

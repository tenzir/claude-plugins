# Device Hardware Info

The Device Hardware Information object contains details and specifications of the physical components that make up a device. This information provides an overview of the hardware capabilities, configuration, and characteristics of the device.

## Attributes

| Attribute | Type | Requirement |
|-----------|------|-------------|
| `bios_date` | string_t | optional |
| `bios_manufacturer` | string_t | optional |
| `bios_ver` | string_t | optional |
| `chassis` | string_t | optional |
| `cpu_architecture` | string_t | optional |
| `cpu_architecture_id` | integer_t | optional |
| `cpu_bits` | integer_t | optional |
| `cpu_cores` | integer_t | optional |
| `cpu_count` | integer_t | optional |
| `cpu_speed` | integer_t | optional |
| `cpu_type` | string_t | optional |
| `desktop_display` | object (display) | optional |
| `keyboard_info` | object (keyboard_info) | optional |
| `ram_size` | integer_t | optional |
| `serial_number` | string_t | optional |
| `uuid` | uuid_t | optional |
| `vendor_name` | string_t | optional |

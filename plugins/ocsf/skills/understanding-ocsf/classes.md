# Classes

Event classes are structured sets of attributes and objects describing specific
security events. Each class has a unique `class_uid` and belongs to a category.

## Class Structure

Every class includes:

- **class_uid**: Unique numeric identifier
- **category_uid**: Parent category
- **Attributes**: Fields organized by requirement level and group
- **Profiles**: Optional mix-ins that can be applied

## Categories

### System Activity (1xxx)

Operating system and endpoint events.

| UID    | Class                           | Description                    |
| ------ | ------------------------------- | ------------------------------ |
| 1001   | `file_activity`                 | File create/modify/delete      |
| 1002   | `kernel_extension_activity`     | Kernel extension load/unload   |
| 1003   | `kernel_activity`               | Kernel-level operations        |
| 1004   | `memory_activity`               | Memory allocation/protection   |
| 1005   | `module_activity`               | Module/library load/unload     |
| 1006   | `scheduled_job_activity`        | Scheduled task operations      |
| 1007   | `process_activity`              | Process start/stop/inject      |
| 1008   | `event_log_actvity`             | Event log access               |
| 1009   | `script_activity`               | Script execution               |
| 1010   | `peripheral_activity`           | USB/peripheral device events   |
| 201001 | `win/registry_key_activity`     | Windows registry key changes   |
| 201002 | `win/registry_value_activity`   | Windows registry value changes |
| 201003 | `win/windows_resource_activity` | Windows resource operations    |
| 201004 | `win/windows_service_activity`  | Windows service operations     |

### Findings (2xxx)

Security detections, vulnerabilities, and compliance results.

| UID  | Class                                  | Description                 |
| ---- | -------------------------------------- | --------------------------- |
| 2001 | `security_finding`                     | General security finding    |
| 2002 | `vulnerability_finding`                | CVE/vulnerability detection |
| 2003 | `compliance_finding`                   | Compliance check result     |
| 2004 | `detection_finding`                    | Threat detection alert      |
| 2005 | `incident_finding`                     | Security incident           |
| 2006 | `data_security_finding`                | DLP/data security finding   |
| 2007 | `application_security_posture_finding` | AppSec posture finding      |
| 2008 | `iam_analysis_finding`                 | IAM analysis result         |

### Identity & Access Management (3xxx)

Authentication, authorization, and account management.

| UID  | Class               | Description                  |
| ---- | ------------------- | ---------------------------- |
| 3001 | `account_change`    | Account create/modify/delete |
| 3002 | `authentication`    | Login/logout attempts        |
| 3003 | `authorize_session` | Session authorization        |
| 3004 | `entity_management` | Identity entity management   |
| 3005 | `user_access`       | User access management       |
| 3006 | `group_management`  | Group membership changes     |

### Network Activity (4xxx)

Network communication and protocol-specific events.

| UID  | Class                   | Description                 |
| ---- | ----------------------- | --------------------------- |
| 4001 | `network_activity`      | General network connections |
| 4002 | `http_activity`         | HTTP request/response       |
| 4003 | `dns_activity`          | DNS queries and responses   |
| 4004 | `dhcp_activity`         | DHCP lease operations       |
| 4005 | `rdp_activity`          | Remote Desktop Protocol     |
| 4006 | `smb_activity`          | SMB/CIFS file sharing       |
| 4007 | `ssh_activity`          | SSH connections             |
| 4008 | `ftp_activity`          | FTP transfers               |
| 4009 | `email_activity`        | Email send/receive          |
| 4010 | `network_file_activity` | Network file operations     |
| 4011 | `email_file_activity`   | Email attachment activity   |
| 4012 | `email_url_activity`    | Email URL activity          |
| 4013 | `ntp_activity`          | NTP time synchronization    |
| 4014 | `tunnel_activity`       | VPN/tunnel connections      |

### Discovery (5xxx)

Asset inventory, configuration state, and queries.

| UID    | Class                            | Description                  |
| ------ | -------------------------------- | ---------------------------- |
| 5001   | `inventory_info`                 | Device inventory             |
| 5002   | `config_state`                   | Device configuration state   |
| 5003   | `user_inventory`                 | User inventory               |
| 5004   | `patch_state`                    | OS patch state               |
| 5006   | `kernel_object_query`            | Kernel object query          |
| 5007   | `file_query`                     | File query results           |
| 5008   | `folder_query`                   | Folder query results         |
| 5009   | `admin_group_query`              | Admin group membership       |
| 5010   | `job_query`                      | Scheduled job query          |
| 5011   | `module_query`                   | Loaded module query          |
| 5012   | `network_connection_query`       | Network connection query     |
| 5013   | `networks_query`                 | Network configuration query  |
| 5014   | `peripheral_device_query`        | Peripheral device query      |
| 5015   | `process_query`                  | Running process query        |
| 5016   | `service_query`                  | Service query                |
| 5017   | `session_query`                  | User session query           |
| 5018   | `user_query`                     | User account query           |
| 5019   | `device_config_state_change`     | Config state change          |
| 5020   | `software_info`                  | Software inventory           |
| 5021   | `osint_inventory_info`           | OSINT inventory              |
| 5022   | `startup_item_query`             | Startup item query           |
| 5023   | `cloud_resources_inventory_info` | Cloud resource inventory     |
| 5040   | `evidence_info`                  | Live evidence info           |
| 205004 | `win/registry_key_query`         | Windows registry key query   |
| 205005 | `win/registry_value_query`       | Windows registry value query |
| 205019 | `win/prefetch_query`             | Windows prefetch query       |

### Application Activity (6xxx)

Application-level events and API activity.

| UID  | Class                          | Description                   |
| ---- | ------------------------------ | ----------------------------- |
| 6001 | `web_resources_activity`       | Web resource operations       |
| 6002 | `application_lifecycle`        | App start/stop/update         |
| 6003 | `api_activity`                 | API calls                     |
| 6004 | `web_resource_access_activity` | Web resource access           |
| 6005 | `datastore_activity`           | Database/datastore operations |
| 6006 | `file_hosting`                 | File hosting activity         |
| 6007 | `scan_activity`                | Security scan activity        |
| 6008 | `application_error`            | Application errors            |

### Remediation (7xxx)

Incident response and remediation actions.

| UID  | Class                          | Description                |
| ---- | ------------------------------ | -------------------------- |
| 7001 | `remediation_activity`         | General remediation action |
| 7002 | `file_remediation_activity`    | File quarantine/delete     |
| 7003 | `process_remediation_activity` | Process termination        |
| 7004 | `network_remediation_activity` | Network block/isolate      |

### Unmanned Systems (8xxx)

Unmanned aerial and autonomous systems (experimental).

| UID  | Class                         | Description            |
| ---- | ----------------------------- | ---------------------- |
| 8001 | `drone_flights_activity`      | Drone flight telemetry |
| 8002 | `airborne_broadcast_activity` | ADS-B/radar broadcasts |

## Base Event

All classes inherit from `base_event` (UID 0), which provides core attributes:

- `time`, `timezone` - When the event occurred
- `class_uid`, `category_uid` - Event classification
- `severity_id`, `status_id` - Severity and status
- `metadata` - Product and logging metadata
- `observables` - Extracted indicators

Detailed per-class documentation is in `references/<version>/classes/`.
See [SKILL.md](./SKILL.md) for available versions.

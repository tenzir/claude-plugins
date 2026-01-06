# Event Classes (OCSF 1.7.0)

Complete listing of event classes by category.

## Other

| UID | Class | Description |
|-----|-------|-------------|
| 0 | [`base_event`](./classes/base_event.md) | Base Event |

## System Activity

| UID | Class | Description |
|-----|-------|-------------|
| 1001 | [`file_activity`](./classes/file_activity.md) | File System Activity |
| 1002 | [`kernel_extension_activity`](./classes/kernel_extension_activity.md) | Kernel Extension Activity |
| 1003 | [`kernel_activity`](./classes/kernel_activity.md) | Kernel Activity |
| 1004 | [`memory_activity`](./classes/memory_activity.md) | Memory Activity |
| 1005 | [`module_activity`](./classes/module_activity.md) | Module Activity |
| 1006 | [`scheduled_job_activity`](./classes/scheduled_job_activity.md) | Scheduled Job Activity |
| 1007 | [`process_activity`](./classes/process_activity.md) | Process Activity |
| 1008 | [`event_log_actvity`](./classes/event_log_actvity.md) | Event Log Activity |
| 1009 | [`script_activity`](./classes/script_activity.md) | Script Activity |
| 1010 | [`peripheral_activity`](./classes/peripheral_activity.md) | Peripheral Activity |
| 201001 | [`win/registry_key_activity`](./classes/win_registry_key_activity.md) | Registry Key Activity |
| 201002 | [`win/registry_value_activity`](./classes/win_registry_value_activity.md) | Registry Value Activity |
| 201003 | [`win/windows_resource_activity`](./classes/win_windows_resource_activity.md) | Windows Resource Activity |
| 201004 | [`win/windows_service_activity`](./classes/win_windows_service_activity.md) | Windows Service Activity |

## Findings

| UID | Class | Description |
|-----|-------|-------------|
| 2001 | [`security_finding`](./classes/security_finding.md) | Security Finding |
| 2002 | [`vulnerability_finding`](./classes/vulnerability_finding.md) | Vulnerability Finding |
| 2003 | [`compliance_finding`](./classes/compliance_finding.md) | Compliance Finding |
| 2004 | [`detection_finding`](./classes/detection_finding.md) | Detection Finding |
| 2005 | [`incident_finding`](./classes/incident_finding.md) | Incident Finding |
| 2006 | [`data_security_finding`](./classes/data_security_finding.md) | Data Security Finding |
| 2007 | [`application_security_posture_finding`](./classes/application_security_posture_finding.md) | Application Security Posture Finding |
| 2008 | [`iam_analysis_finding`](./classes/iam_analysis_finding.md) | IAM Analysis Finding |

## Identity & Access Management

| UID | Class | Description |
|-----|-------|-------------|
| 3001 | [`account_change`](./classes/account_change.md) | Account Change |
| 3002 | [`authentication`](./classes/authentication.md) | Authentication |
| 3003 | [`authorize_session`](./classes/authorize_session.md) | Authorize Session |
| 3004 | [`entity_management`](./classes/entity_management.md) | Entity Management |
| 3005 | [`user_access`](./classes/user_access.md) | User Access Management |
| 3006 | [`group_management`](./classes/group_management.md) | Group Management |

## Network Activity

| UID | Class | Description |
|-----|-------|-------------|
| 4001 | [`network_activity`](./classes/network_activity.md) | Network Activity |
| 4002 | [`http_activity`](./classes/http_activity.md) | HTTP Activity |
| 4003 | [`dns_activity`](./classes/dns_activity.md) | DNS Activity |
| 4004 | [`dhcp_activity`](./classes/dhcp_activity.md) | DHCP Activity |
| 4005 | [`rdp_activity`](./classes/rdp_activity.md) | RDP Activity |
| 4006 | [`smb_activity`](./classes/smb_activity.md) | SMB Activity |
| 4007 | [`ssh_activity`](./classes/ssh_activity.md) | SSH Activity |
| 4008 | [`ftp_activity`](./classes/ftp_activity.md) | FTP Activity |
| 4009 | [`email_activity`](./classes/email_activity.md) | Email Activity |
| 4010 | [`network_file_activity`](./classes/network_file_activity.md) | Network File Activity |
| 4011 | [`email_file_activity`](./classes/email_file_activity.md) | Email File Activity |
| 4012 | [`email_url_activity`](./classes/email_url_activity.md) | Email URL Activity |
| 4013 | [`ntp_activity`](./classes/ntp_activity.md) | NTP Activity |
| 4014 | [`tunnel_activity`](./classes/tunnel_activity.md) | Tunnel Activity |

## Discovery

| UID | Class | Description |
|-----|-------|-------------|
| 5001 | [`inventory_info`](./classes/inventory_info.md) | Device Inventory Info |
| 5002 | [`config_state`](./classes/config_state.md) | Device Config State |
| 5003 | [`user_inventory`](./classes/user_inventory.md) | User Inventory Info |
| 5004 | [`patch_state`](./classes/patch_state.md) | Operating System Patch State |
| 5006 | [`kernel_object_query`](./classes/kernel_object_query.md) | Kernel Object Query |
| 5007 | [`file_query`](./classes/file_query.md) | File Query |
| 5008 | [`folder_query`](./classes/folder_query.md) | Folder Query |
| 5009 | [`admin_group_query`](./classes/admin_group_query.md) | Admin Group Query |
| 5010 | [`job_query`](./classes/job_query.md) | Job Query |
| 5011 | [`module_query`](./classes/module_query.md) | Module Query |
| 5012 | [`network_connection_query`](./classes/network_connection_query.md) | Network Connection Query |
| 5013 | [`networks_query`](./classes/networks_query.md) | Networks Query |
| 5014 | [`peripheral_device_query`](./classes/peripheral_device_query.md) | Peripheral Device Query |
| 5015 | [`process_query`](./classes/process_query.md) | Process Query |
| 5016 | [`service_query`](./classes/service_query.md) | Service Query |
| 5017 | [`session_query`](./classes/session_query.md) | User Session Query |
| 5018 | [`user_query`](./classes/user_query.md) | User Query |
| 5019 | [`device_config_state_change`](./classes/device_config_state_change.md) | Device Config State Change |
| 5020 | [`software_info`](./classes/software_info.md) | Software Inventory Info |
| 5021 | [`osint_inventory_info`](./classes/osint_inventory_info.md) | OSINT Inventory Info |
| 5022 | [`startup_item_query`](./classes/startup_item_query.md) | Startup Item Query |
| 5023 | [`cloud_resources_inventory_info`](./classes/cloud_resources_inventory_info.md) | Cloud Resources Inventory Info |
| 5040 | [`evidence_info`](./classes/evidence_info.md) | Live Evidence Info |
| 205004 | [`win/registry_key_query`](./classes/win_registry_key_query.md) | Registry Key Query |
| 205005 | [`win/registry_value_query`](./classes/win_registry_value_query.md) | Registry Value Query |
| 205019 | [`win/prefetch_query`](./classes/win_prefetch_query.md) | Prefetch Query |

## Application Activity

| UID | Class | Description |
|-----|-------|-------------|
| 6001 | [`web_resources_activity`](./classes/web_resources_activity.md) | Web Resources Activity |
| 6002 | [`application_lifecycle`](./classes/application_lifecycle.md) | Application Lifecycle |
| 6003 | [`api_activity`](./classes/api_activity.md) | API Activity |
| 6004 | [`web_resource_access_activity`](./classes/web_resource_access_activity.md) | Web Resource Access Activity |
| 6005 | [`datastore_activity`](./classes/datastore_activity.md) | Datastore Activity |
| 6006 | [`file_hosting`](./classes/file_hosting.md) | File Hosting Activity |
| 6007 | [`scan_activity`](./classes/scan_activity.md) | Scan Activity |
| 6008 | [`application_error`](./classes/application_error.md) | Application Error |

## Remediation

| UID | Class | Description |
|-----|-------|-------------|
| 7001 | [`remediation_activity`](./classes/remediation_activity.md) | Remediation Activity |
| 7002 | [`file_remediation_activity`](./classes/file_remediation_activity.md) | File Remediation Activity |
| 7003 | [`process_remediation_activity`](./classes/process_remediation_activity.md) | Process Remediation Activity |
| 7004 | [`network_remediation_activity`](./classes/network_remediation_activity.md) | Network Remediation Activity |

## Unmanned Systems

| UID | Class | Description |
|-----|-------|-------------|
| 8001 | [`drone_flights_activity`](./classes/drone_flights_activity.md) | Drone Flights Activity |
| 8002 | [`airborne_broadcast_activity`](./classes/airborne_broadcast_activity.md) | Airborne Broadcast Activity |

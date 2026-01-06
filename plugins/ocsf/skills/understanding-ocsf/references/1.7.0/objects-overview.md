# Objects (OCSF 1.7.0)

Complete listing of objects by category.

## Identity & Access (17 objects)

- [`account`](./objects/account.md) - Account
- [`actor`](./objects/actor.md) - Actor
- [`auth_factor`](./objects/auth_factor.md) - Authentication Factor
- [`authentication_token`](./objects/authentication_token.md) - Authentication Token
- [`authorization`](./objects/authorization.md) - Authorization Result
- [`email_auth`](./objects/email_auth.md) - Email Authentication
- [`group`](./objects/group.md) - Group
- [`idp`](./objects/idp.md) - Identity Provider
- [`ldap_person`](./objects/ldap_person.md) - LDAP Person
- [`organization`](./objects/organization.md) - Organization
- [`policy`](./objects/policy.md) - Policy
- [`session`](./objects/session.md) - Session
- [`sso`](./objects/sso.md) - SSO
- [`threat_actor`](./objects/threat_actor.md) - Threat Actor
- [`ticket`](./objects/ticket.md) - Ticket
- [`trait`](./objects/trait.md) - Trait
- [`user`](./objects/user.md) - User

## Process & System (19 objects)

- [`agent`](./objects/agent.md) - Agent
- [`application`](./objects/application.md) - Application
- [`container`](./objects/container.md) - Container
- [`device`](./objects/device.md) - Device
- [`device_hw_info`](./objects/device_hw_info.md) - Device Hardware Info
- [`display`](./objects/display.md) - Display
- [`environment_variable`](./objects/environment_variable.md) - Environment Variable
- [`image`](./objects/image.md) - Image
- [`kernel`](./objects/kernel.md) - Kernel Resource
- [`kernel_driver`](./objects/kernel_driver.md) - Kernel Extension
- [`keyboard_info`](./objects/keyboard_info.md) - Keyboard Information
- [`module`](./objects/module.md) - Module
- [`os`](./objects/os.md) - Operating System (OS)
- [`osint`](./objects/osint.md) - OSINT
- [`peripheral_device`](./objects/peripheral_device.md) - Peripheral Device
- [`process`](./objects/process.md) - Process
- [`process_entity`](./objects/process_entity.md) - Process Entity
- [`service`](./objects/service.md) - Service
- [`startup_item`](./objects/startup_item.md) - Startup Item

## Network (18 objects)

- [`autonomous_system`](./objects/autonomous_system.md) - Autonomous System
- [`dns_answer`](./objects/dns_answer.md) - DNS Answer
- [`dns_query`](./objects/dns_query.md) - DNS Query
- [`endpoint`](./objects/endpoint.md) - Endpoint
- [`endpoint_connection`](./objects/endpoint_connection.md) - Endpoint Connection
- [`firewall_rule`](./objects/firewall_rule.md) - Firewall Rule
- [`http_cookie`](./objects/http_cookie.md) - HTTP Cookie
- [`http_header`](./objects/http_header.md) - HTTP Header
- [`http_request`](./objects/http_request.md) - HTTP Request
- [`http_response`](./objects/http_response.md) - HTTP Response
- [`load_balancer`](./objects/load_balancer.md) - Load Balancer
- [`network_connection_info`](./objects/network_connection_info.md) - Network Connection Information
- [`network_endpoint`](./objects/network_endpoint.md) - Network Endpoint
- [`network_interface`](./objects/network_interface.md) - Network Interface
- [`network_proxy`](./objects/network_proxy.md) - Network Proxy Endpoint
- [`network_traffic`](./objects/network_traffic.md) - Network Traffic
- [`tls`](./objects/tls.md) - Transport Layer Security (TLS)
- [`tls_extension`](./objects/tls_extension.md) - TLS Extension

## File & Data (15 objects)

- [`affected_package`](./objects/affected_package.md) - Affected Software Package
- [`data_classification`](./objects/data_classification.md) - Data Classification
- [`data_security`](./objects/data_security.md) - Data Security
- [`database`](./objects/database.md) - Database
- [`databucket`](./objects/databucket.md) - Databucket
- [`digital_signature`](./objects/digital_signature.md) - Digital Signature
- [`encryption_details`](./objects/encryption_details.md) - Encryption Details
- [`file`](./objects/file.md) - File
- [`fingerprint`](./objects/fingerprint.md) - Fingerprint
- [`hassh`](./objects/hassh.md) - HASSH
- [`ja4_fingerprint`](./objects/ja4_fingerprint.md) - JA4+ Fingerprint
- [`package`](./objects/package.md) - Software Package
- [`sbom`](./objects/sbom.md) - Software Bill of Materials
- [`script`](./objects/script.md) - Script
- [`software_component`](./objects/software_component.md) - Software Component

## Security & Compliance (27 objects)

- [`analytic`](./objects/analytic.md) - Analytic
- [`anomaly`](./objects/anomaly.md) - Anomaly
- [`anomaly_analysis`](./objects/anomaly_analysis.md) - Anomaly Analysis
- [`assessment`](./objects/assessment.md) - Assessment
- [`attack`](./objects/attack.md) - MITRE ATT&CK® & ATLAS™
- [`baseline`](./objects/baseline.md) - Baseline
- [`campaign`](./objects/campaign.md) - Campaign
- [`check`](./objects/check.md) - Check
- [`cis_benchmark`](./objects/cis_benchmark.md) - CIS Benchmark
- [`cis_benchmark_result`](./objects/cis_benchmark_result.md) - CIS Benchmark Result
- [`cis_control`](./objects/cis_control.md) - CIS Control
- [`cis_csc`](./objects/cis_csc.md) - CIS CSC
- [`compliance`](./objects/compliance.md) - Compliance
- [`cve`](./objects/cve.md) - CVE
- [`cvss`](./objects/cvss.md) - CVSS Score
- [`cwe`](./objects/cwe.md) - CWE
- [`d3f_tactic`](./objects/d3f_tactic.md) - MITRE D3FEND™ Tactic
- [`d3f_technique`](./objects/d3f_technique.md) - MITRE D3FEND™ Technique
- [`d3fend`](./objects/d3fend.md) - MITRE D3FEND™
- [`finding`](./objects/finding.md) - Finding
- [`finding_info`](./objects/finding_info.md) - Finding Information
- [`kill_chain_phase`](./objects/kill_chain_phase.md) - Kill Chain Phase
- [`malware`](./objects/malware.md) - Malware
- [`malware_scan_info`](./objects/malware_scan_info.md) - Malware Scan Info
- [`mitigation`](./objects/mitigation.md) - MITRE Mitigation
- [`rule`](./objects/rule.md) - Rule
- [`vulnerability`](./objects/vulnerability.md) - Vulnerability Details

## Cloud & Infrastructure (11 objects)

- [`api`](./objects/api.md) - API
- [`cloud`](./objects/cloud.md) - Cloud
- [`function_invocation`](./objects/function_invocation.md) - Function Invocation
- [`job`](./objects/job.md) - Job
- [`managed_entity`](./objects/managed_entity.md) - Managed Entity
- [`product`](./objects/product.md) - Product
- [`reporter`](./objects/reporter.md) - Reporter
- [`request`](./objects/request.md) - Request Elements
- [`resource_details`](./objects/resource_details.md) - Resource Details
- [`response`](./objects/response.md) - Response Elements
- [`web_resource`](./objects/web_resource.md) - Web Resource

## Observability (15 objects)

- [`enrichment`](./objects/enrichment.md) - Enrichment
- [`evidences`](./objects/evidences.md) - Evidence Artifacts
- [`graph`](./objects/graph.md) - Graph
- [`identity_activity_metrics`](./objects/identity_activity_metrics.md) - Identity Activity Metrics
- [`logger`](./objects/logger.md) - Logger
- [`metric`](./objects/metric.md) - Metric
- [`node`](./objects/node.md) - Node
- [`observable`](./objects/observable.md) - Observable
- [`observation`](./objects/observation.md) - Observation
- [`occurrence_details`](./objects/occurrence_details.md) - Occurrence Details
- [`query_evidence`](./objects/query_evidence.md) - Query Evidence
- [`span`](./objects/span.md) - Span
- [`timespan`](./objects/timespan.md) - Time Span
- [`trace`](./objects/trace.md) - Trace
- [`transformation_info`](./objects/transformation_info.md) - Transformation Info

## Windows (4 objects)

- [`win/reg_key`](./objects/win_reg_key.md) - Registry Key
- [`win/reg_value`](./objects/win_reg_value.md) - Registry Value
- [`win/win_resource`](./objects/win_win_resource.md) - Windows Resource
- [`win/win_service`](./objects/win_win_service.md) - Windows Service

## Other (44 objects)

- [`access_analysis_result`](./objects/access_analysis_result.md) - Access Analysis Result
- [`additional_restriction`](./objects/additional_restriction.md) - Additional Restriction
- [`advisory`](./objects/advisory.md) - Advisory
- [`affected_code`](./objects/affected_code.md) - Affected Code
- [`aircraft`](./objects/aircraft.md) - Aircraft
- [`analysis_target`](./objects/analysis_target.md) - Analysis Target
- [`certificate`](./objects/certificate.md) - Digital Certificate
- [`classifier_details`](./objects/classifier_details.md) - Classifier Details
- [`dce_rpc`](./objects/dce_rpc.md) - DCE/RPC
- [`discovery_details`](./objects/discovery_details.md) - Discovery Details
- [`domain_contact`](./objects/domain_contact.md) - Domain Contact
- [`edge`](./objects/edge.md) - Edge
- [`email`](./objects/email.md) - Email
- [`epss`](./objects/epss.md) - EPSS
- [`extension`](./objects/extension.md) - Schema Extension
- [`feature`](./objects/feature.md) - Feature
- [`kb_article`](./objects/kb_article.md) - KB Article
- [`key_value_object`](./objects/key_value_object.md) - Key:Value object
- [`location`](./objects/location.md) - Geo Location
- [`long_string`](./objects/long_string.md) - Long String
- [`metadata`](./objects/metadata.md) - Metadata
- [`object`](./objects/object.md) - Object
- [`parameter`](./objects/parameter.md) - Parameter
- [`permission_analysis_result`](./objects/permission_analysis_result.md) - Permission Analysis Result
- [`port_info`](./objects/port_info.md) - Port Information
- [`programmatic_credential`](./objects/programmatic_credential.md) - Programmatic Credential
- [`query_info`](./objects/query_info.md) - Query Information
- [`related_event`](./objects/related_event.md) - Related Event/Finding
- [`remediation`](./objects/remediation.md) - Remediation
- [`reputation`](./objects/reputation.md) - Reputation
- [`rpc_interface`](./objects/rpc_interface.md) - RPC Interface
- [`san`](./objects/san.md) - Subject Alternative Name
- [`scan`](./objects/scan.md) - Scan
- [`scim`](./objects/scim.md) - SCIM
- [`security_state`](./objects/security_state.md) - Security State
- [`sub_technique`](./objects/sub_technique.md) - MITRE Sub-technique
- [`table`](./objects/table.md) - Table
- [`tactic`](./objects/tactic.md) - MITRE Tactic
- [`technique`](./objects/technique.md) - MITRE Technique
- [`unmanned_aerial_system`](./objects/unmanned_aerial_system.md) - Unmanned Aerial System
- [`unmanned_system_operating_area`](./objects/unmanned_system_operating_area.md) - Unmanned System Operating Area
- [`url`](./objects/url.md) - Uniform Resource Locator
- [`vendor_attributes`](./objects/vendor_attributes.md) - Vendor Attributes
- [`whois`](./objects/whois.md) - WHOIS

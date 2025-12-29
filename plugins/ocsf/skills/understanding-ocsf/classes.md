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

OCSF organizes event classes into categories by UID range:

### System Activity (1xxx)

Operating system and endpoint events: file operations, process lifecycle,
kernel activity, module loading, scheduled tasks, and peripheral device events.

### Findings (2xxx)

Security detections, vulnerabilities, and compliance results: security findings,
CVE detections, compliance checks, threat detections, and incidents.

### Identity & Access Management (3xxx)

Authentication, authorization, and account management: account changes,
login/logout attempts, session authorization, and group management.

### Network Activity (4xxx)

Network communication and protocol-specific events: general network connections,
HTTP, DNS, DHCP, RDP, SMB, SSH, FTP, email, and tunnel activity.

### Discovery (5xxx)

Asset inventory, configuration state, and queries: device inventory, patch
state, running processes, network connections, and user sessions.

### Application Activity (6xxx)

Application-level events and API activity: web resources, application
lifecycle, API calls, datastore operations, and security scans.

### Remediation (7xxx)

Incident response and remediation actions: file quarantine, process
termination, and network isolation.

### Unmanned Systems (8xxx)

Unmanned aerial and autonomous systems (experimental): drone flight telemetry
and airborne broadcasts.

## Base Event

All classes inherit from `base_event` (UID 0), which provides core attributes:

- `time`, `timezone` - When the event occurred
- `class_uid`, `category_uid` - Event classification
- `severity_id`, `status_id` - Severity and status
- `metadata` - Product and logging metadata
- `observables` - Extracted indicators

## Version-Specific Details

For the complete list of classes and their UIDs in each OCSF version, see the
versioned reference documentation under `references/<version>/classes-overview.md`.
Detailed per-class documentation is in `references/<version>/classes/`.

# Profiles

Profiles overlay additional related attributes into event classes and objects,
allowing for cross-category event class augmentation and filtering. Think of
them as mixins that add optional context without modifying the base class.

## How Profiles Work

When a profile is applied to an event, the event gains additional attributes
from that profile while keeping its base class identity. This enables flexible
querying—you can find events either by their class name or by the profiles
applied to them. For example, all events with the `security_control` profile
share common attributes like `disposition` and `action`, regardless of whether
they're `network_activity` or `file_activity` events.

- Event classes register for profiles they support in their `profiles` array
- Producers and mappers can optionally apply profiles to events
- Applied profiles are listed in `metadata.profiles`
- Multiple profiles can be applied to a single event
- Profile attributes have their own requirement levels
- Not all profile attributes must be used together—a profile defining
  attributes A, B, and C could have A in one class while B and C appear
  elsewhere

## Profile Categories

OCSF profiles fall into several categories:

### Infrastructure Context

Profiles that add environmental context about where events occur:

- **Cloud**: Cloud provider details (account, region, availability zone)
- **Container**: Container runtime context (image, pod, orchestrator)
- **Host**: Host/device attributes for the event source
- **Load Balancer**: Load balancer routing context
- **Network Proxy**: Proxy connection details (endpoints, TLS, traffic)

### Security Context

Profiles that add security-relevant information:

- **Security Control**: Outcomes of security controls (disposition, action,
  malware detection, policy violations)
- **Incident**: Incident handling semantics (priority, impact, verdict)
- **OSINT**: Open Source Intelligence enrichment with indicators
- **Data Classification**: Data sensitivity levels and classification results

### Observability Context

Profiles that enhance monitoring and tracing:

- **Datetime**: Extended timestamp fields in RFC-3339 format
- **Trace**: Distributed tracing context (trace_id, span relationships)

### Platform-Specific

Profiles for specific operating systems or platforms:

- **Linux Users**: Linux-specific user attributes (auid, egid, euid)

## Applying Profiles

When creating OCSF events, include profile attributes based on:

1. **Data availability**: Only include if you have the data
2. **Class support**: Check if the class supports the profile
3. **Consumer needs**: Consider what downstream systems need

A single event can include attributes from multiple profiles. For example,
a `process_activity` event might include both `host` and `container` context.

## Version-Specific Details

For the complete list of profiles and their attributes in each OCSF version,
see the versioned reference documentation under `references/<version>/profiles/`.

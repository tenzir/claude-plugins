# Profiles

Profiles are dynamic mix-ins that augment event classes with cross-cutting
attributes. They add optional context without modifying the base class.

## How Profiles Work

- Each class lists supported profiles in its `profiles` array
- Multiple profiles can be applied to a single event
- Profiles add attributes with their own requirement levels
- Profile attributes are optional - only include when data is available

## Available Profiles

| Profile               | Purpose                                      |
| --------------------- | -------------------------------------------- |
| `cloud`               | Cloud provider context (account, region, AZ) |
| `container`           | Container runtime context (image, pod, k8s)  |
| `data_classification` | Data sensitivity and classification          |
| `datetime`            | Extended datetime fields beyond `time`       |
| `host`                | Host/device context for the event source     |
| `incident`            | Incident response context                    |
| `linux/linux_users`   | Linux-specific user attributes               |
| `load_balancer`       | Load balancer context                        |
| `network_proxy`       | Network proxy context                        |
| `osint`               | Open source intelligence enrichment          |
| `security_control`    | Security control context                     |
| `trace`               | Distributed tracing context (trace_id, span) |

## Profile Details

### cloud

Adds cloud infrastructure context:

- `cloud.provider` - Cloud provider name (AWS, Azure, GCP)
- `cloud.account.uid` - Account/subscription identifier
- `cloud.region` - Geographic region
- `cloud.zone` - Availability zone
- `cloud.org` - Organization structure

### container

Adds container runtime context:

- `container.name` - Container name
- `container.image` - Container image details
- `container.runtime` - Container runtime (Docker, containerd)
- `container.orchestrator` - Orchestration platform (Kubernetes)
- `container.pod_uuid` - Kubernetes pod identifier

### host

Adds host/device context:

- `device.hostname` - Device hostname
- `device.ip` - Device IP address
- `device.os` - Operating system details
- `device.type` - Device type (server, workstation, mobile)

### security_control

Adds security control context:

- `attacks` - MITRE ATT&CK tactics and techniques
- `firewall_rule` - Applied firewall rules
- `policy` - Security policy information

### datetime

Adds extended datetime fields:

- `start_time`, `start_time_dt` - Event start time
- `end_time`, `end_time_dt` - Event end time
- `duration` - Event duration

### osint

Adds threat intelligence context:

- `osint` - OSINT indicators and enrichment
- Related threat actor, campaign, malware information

### trace

Adds distributed tracing context:

- `trace_id` - Distributed trace identifier
- `span_id` - Span identifier within trace
- `parent_span_id` - Parent span for hierarchy

## Applying Profiles

When creating OCSF events, include profile attributes based on:

1. **Data availability** - Only include if you have the data
2. **Class support** - Check if the class supports the profile
3. **Consumer needs** - Consider what downstream systems need

A single event can include attributes from multiple profiles. For example,
a `process_activity` event might include both `host` and `container` context.

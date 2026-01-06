#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# ///
"""
Generate OCSF reference documentation from the official schema.

This script fetches the OCSF schema from schema.ocsf.io and generates
compact Markdown reference files for each event class and object.

Usage:
    uv run generate-references.py [--version 1.7.0] [--all]

Options:
    --version   OCSF version to generate (default: latest stable)
    --all       Generate for all stable versions
"""

import argparse
import json
import urllib.request
from pathlib import Path


SCRIPT_DIR = Path(__file__).parent
PLUGIN_DIR = SCRIPT_DIR.parent
SKILL_DIR = PLUGIN_DIR / "skills" / "understanding-ocsf"
REFS_DIR = SKILL_DIR / "references"

OCSF_BASE_URL = "https://schema.ocsf.io"


def fetch_current_version() -> str:
    """Fetch the current/latest OCSF version."""
    url = f"{OCSF_BASE_URL}/api/version"
    print(f"Fetching current version from {url}...")
    with urllib.request.urlopen(url, timeout=30) as response:
        data = json.loads(response.read().decode())
    version = data["version"]
    print(f"  Current version: {version}")
    return version


def fetch_available_versions() -> list[str]:
    """Fetch list of available OCSF versions from the API."""
    url = f"{OCSF_BASE_URL}/api/versions"
    print(f"Fetching available versions from {url}...")
    with urllib.request.urlopen(url, timeout=30) as response:
        data = json.loads(response.read().decode())

    versions = data.get("versions", [])

    # Filter to stable versions only (no dev, alpha, beta, rc)
    stable = [v for v in versions if not any(
        tag in v.lower() for tag in ["dev", "alpha", "beta", "rc"]
    )]

    # Sort by semantic version
    stable.sort(key=lambda v: [int(x) for x in v.split(".")])

    print(f"  Found {len(stable)} stable versions: {stable[0]} to {stable[-1]}")
    return stable


def fetch_schema(version: str | None = None) -> dict:
    """Fetch OCSF schema from schema.ocsf.io."""
    if version:
        url = f"{OCSF_BASE_URL}/{version}/export/schema"
    else:
        url = f"{OCSF_BASE_URL}/export/schema"
    print(f"Fetching schema from {url}...")
    with urllib.request.urlopen(url, timeout=120) as response:
        return json.loads(response.read().decode())


def fetch_profiles(version: str | None = None) -> dict:
    """Fetch OCSF profiles from the API (separate from schema export)."""
    if version:
        url = f"{OCSF_BASE_URL}/api/{version}/profiles"
    else:
        url = f"{OCSF_BASE_URL}/api/profiles"
    print(f"Fetching profiles from {url}...")
    with urllib.request.urlopen(url, timeout=30) as response:
        return json.loads(response.read().decode())


def generate_class_doc(class_name: str, class_data: dict, all_objects: dict) -> str:
    """Generate Markdown documentation for an event class."""
    lines = []

    # Header
    caption = class_data.get("caption", class_name)
    uid = class_data.get("uid", "")
    lines.append(f"# {caption} ({uid})")
    lines.append("")

    # Description
    description = class_data.get("description", "")
    if description:
        # Clean HTML tags from description
        description = description.replace("<code>", "`").replace("</code>", "`")
        description = description.replace("<br>", " ").replace("<br/>", " ")
        lines.append(description)
        lines.append("")

    # Metadata
    category = class_data.get("category", "")
    category_name = class_data.get("category_name", category)
    extends = class_data.get("extends", "")
    lines.append(f"**Category**: {category_name}")
    if extends:
        lines.append(f"**Extends**: {extends}")
    lines.append(f"**UID**: {uid}")
    lines.append("")

    # Profiles
    profiles = class_data.get("profiles", [])
    if profiles:
        lines.append("## Profiles")
        lines.append("")
        lines.append(", ".join(f"`{p}`" for p in profiles))
        lines.append("")

    # Attributes by requirement
    attributes = class_data.get("attributes", {})
    if attributes:
        # Group by requirement
        required = []
        recommended = []
        optional = []

        for attr_name, attr_data in sorted(attributes.items()):
            req = attr_data.get("requirement", "optional")
            attr_type = attr_data.get("type", "")
            obj_type = attr_data.get("object_type", "")
            if obj_type:
                attr_type = f"object ({obj_type})"

            entry = (attr_name, attr_type)
            if req == "required":
                required.append(entry)
            elif req == "recommended":
                recommended.append(entry)
            else:
                optional.append(entry)

        lines.append("## Attributes")
        lines.append("")

        if required:
            lines.append("### Required")
            lines.append("")
            lines.append("| Attribute | Type |")
            lines.append("|-----------|------|")
            for name, atype in required:
                lines.append(f"| `{name}` | {atype} |")
            lines.append("")

        if recommended:
            lines.append("### Recommended")
            lines.append("")
            lines.append("| Attribute | Type |")
            lines.append("|-----------|------|")
            for name, atype in recommended:
                lines.append(f"| `{name}` | {atype} |")
            lines.append("")

        if optional:
            lines.append("### Optional")
            lines.append("")
            lines.append("| Attribute | Type |")
            lines.append("|-----------|------|")
            for name, atype in optional:
                lines.append(f"| `{name}` | {atype} |")
            lines.append("")

    # Object references
    object_refs = set()
    for attr_data in attributes.values():
        obj_type = attr_data.get("object_type")
        if obj_type and obj_type in all_objects:
            object_refs.add(obj_type)

    if object_refs:
        lines.append("## Objects Used")
        lines.append("")
        for obj_name in sorted(object_refs):
            lines.append(f"- [{obj_name}](../objects/{obj_name}.md)")
        lines.append("")

    return "\n".join(lines)


def generate_object_doc(
    obj_name: str, obj_data: dict, class_usage: dict[str, list[str]]
) -> str:
    """Generate Markdown documentation for an object."""
    lines = []

    # Header
    caption = obj_data.get("caption", obj_name)
    lines.append(f"# {caption}")
    lines.append("")

    # Description
    description = obj_data.get("description", "")
    if description:
        # Clean HTML tags
        description = description.replace("<code>", "`").replace("</code>", "`")
        description = description.replace("<br>", " ").replace("<br/>", " ")
        description = (
            description.replace("<a ", "")
            .replace("</a>", "")
            .replace("target='_blank'", "")
            .replace("href='", "[")
            .replace("'>", "](")
        )
        lines.append(description)
        lines.append("")

    # Extends
    extends = obj_data.get("extends", "")
    if extends and extends != "object":
        lines.append(f"**Extends**: {extends}")
        lines.append("")

    # Attributes
    attributes = obj_data.get("attributes", {})
    if attributes:
        lines.append("## Attributes")
        lines.append("")
        lines.append("| Attribute | Type | Requirement |")
        lines.append("|-----------|------|-------------|")

        for attr_name, attr_data in sorted(attributes.items()):
            attr_type = attr_data.get("type", "")
            obj_type = attr_data.get("object_type", "")
            if obj_type:
                attr_type = f"object ({obj_type})"
            req = attr_data.get("requirement", "optional")
            lines.append(f"| `{attr_name}` | {attr_type} | {req} |")

        lines.append("")

    # Constraints
    constraints = obj_data.get("constraints", {})
    if constraints:
        at_least_one = constraints.get("at_least_one", [])
        if at_least_one:
            lines.append("## Constraints")
            lines.append("")
            lines.append(
                f"At least one of: {', '.join(f'`{c}`' for c in at_least_one)}"
            )
            lines.append("")

    # Used by classes
    used_by = class_usage.get(obj_name, [])
    if used_by:
        lines.append("## Used By")
        lines.append("")
        for class_name in sorted(used_by)[:20]:  # Limit to 20
            lines.append(f"- [{class_name}](../classes/{class_name}.md)")
        if len(used_by) > 20:
            lines.append(f"- ... ({len(used_by) - 20} more)")
        lines.append("")

    return "\n".join(lines)


def build_class_usage(classes: dict, objects: dict) -> dict[str, list[str]]:
    """Build a mapping of object -> list of classes that use it."""
    usage: dict[str, list[str]] = {obj_name: [] for obj_name in objects}

    for class_name, class_data in classes.items():
        attributes = class_data.get("attributes", {})
        for attr_data in attributes.values():
            obj_type = attr_data.get("object_type")
            if obj_type and obj_type in usage:
                usage[obj_type].append(class_name)

    return usage


def generate_version_index(
    version_dir: Path, classes: dict, objects: dict, profiles: dict
) -> None:
    """Generate index.md for a specific version."""
    lines = [
        f"# OCSF {version_dir.name}",
        "",
        f"Schema reference for OCSF version {version_dir.name}.",
        "",
        "## Overviews",
        "",
        f"- [Classes Overview](./classes-overview.md) - All {len(classes)} event classes by category",
        f"- [Objects Overview](./objects-overview.md) - All {len(objects)} objects by category",
        "",
        f"## Profiles ({len(profiles)})",
        "",
    ]

    # List profiles
    for profile_name in sorted(profiles.keys()):
        profile_data = profiles[profile_name]
        caption = profile_data.get("caption", profile_name)
        filename = profile_name.replace("/", "_")
        lines.append(f"- [{caption}](./profiles/{filename}.md) (`{profile_name}`)")

    lines.append("")
    lines.append(f"## Classes ({len(classes)})")
    lines.append("")

    # Group classes by category
    by_category: dict[str, list[tuple[str, int]]] = {}
    for class_name, class_data in classes.items():
        cat = class_data.get("category_name", "Other")
        uid = class_data.get("uid", 0)
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append((class_name, uid))

    for category in sorted(by_category.keys()):
        lines.append(f"### {category}")
        lines.append("")
        for class_name, uid in sorted(by_category[category], key=lambda x: x[1]):
            filename = class_name.replace("/", "_")
            lines.append(f"- [{class_name}](./classes/{filename}.md) ({uid})")
        lines.append("")

    lines.append(f"## Objects ({len(objects)})")
    lines.append("")
    for obj_name in sorted(objects.keys()):
        filename = obj_name.replace("/", "_")
        lines.append(f"- [{obj_name}](./objects/{filename}.md)")

    lines.append("")
    (version_dir / "index.md").write_text("\n".join(lines))


def generate_profile_doc(profile_name: str, profile_data: dict) -> str:
    """Generate Markdown documentation for a profile."""
    lines = []

    # Header
    caption = profile_data.get("caption", profile_name)
    lines.append(f"# {caption}")
    lines.append("")

    # Description
    description = profile_data.get("description", "")
    if description:
        description = description.replace("<code>", "`").replace("</code>", "`")
        description = description.replace("<br>", " ").replace("<br/>", " ")
        lines.append(description)
        lines.append("")

    # Extension info
    extension = profile_data.get("extension")
    if extension:
        lines.append(f"**Extension**: {extension}")
        lines.append("")

    # Attributes
    attributes = profile_data.get("attributes", {})
    if attributes:
        lines.append("## Attributes")
        lines.append("")
        lines.append("| Attribute | Type | Requirement | Description |")
        lines.append("|-----------|------|-------------|-------------|")

        for attr_name, attr_data in sorted(attributes.items()):
            attr_type = attr_data.get("type", "")
            obj_type = attr_data.get("object_type", "")
            if obj_type:
                attr_type = f"object ({obj_type})"
            req = attr_data.get("requirement", "optional")
            desc = attr_data.get("caption", "")
            lines.append(f"| `{attr_name}` | {attr_type} | {req} | {desc} |")

        lines.append("")

    return "\n".join(lines)


def generate_classes_overview(version: str, classes: dict) -> str:
    """Generate classes overview with category tables."""
    lines = [
        f"# Event Classes (OCSF {version})",
        "",
        "Complete listing of event classes by category.",
        "",
    ]

    # Group by category
    by_category: dict[str, list[tuple[str, int, str]]] = {}
    for class_name, class_data in classes.items():
        cat = class_data.get("category_name", "Other")
        uid = class_data.get("uid", 0)
        desc = class_data.get("caption", class_name)
        if cat not in by_category:
            by_category[cat] = []
        by_category[cat].append((class_name, uid, desc))

    # Sort categories by their lowest UID (approximates category order)
    sorted_cats = sorted(by_category.keys(), key=lambda c: min(x[1] for x in by_category[c]))

    for category in sorted_cats:
        lines.append(f"## {category}")
        lines.append("")
        lines.append("| UID | Class | Description |")
        lines.append("|-----|-------|-------------|")
        for class_name, uid, desc in sorted(by_category[category], key=lambda x: x[1]):
            filename = class_name.replace("/", "_")
            lines.append(f"| {uid} | [`{class_name}`](./classes/{filename}.md) | {desc} |")
        lines.append("")

    return "\n".join(lines)


def generate_objects_overview(version: str, objects: dict) -> str:
    """Generate objects overview by category."""
    lines = [
        f"# Objects (OCSF {version})",
        "",
        "Complete listing of objects by category.",
        "",
    ]

    # Categorize objects based on naming patterns and common groupings
    categories: dict[str, list[tuple[str, str]]] = {
        "Identity & Access": [],
        "Process & System": [],
        "Network": [],
        "File & Data": [],
        "Security & Compliance": [],
        "Cloud & Infrastructure": [],
        "Observability": [],
        "Windows": [],
        "Other": [],
    }

    # Keywords for categorization
    identity_kw = {"account", "actor", "auth", "user", "group", "idp", "ldap", "org", "policy", "session", "sso", "ticket", "trait"}
    process_kw = {"agent", "application", "container", "device", "display", "environment", "image", "kernel", "keyboard", "module", "os", "peripheral", "process", "service", "startup"}
    network_kw = {"autonomous", "dns", "endpoint", "firewall", "http", "load_balancer", "network", "proxy", "tls", "tunnel"}
    file_kw = {"data_class", "data_security", "database", "databucket", "digital_signature", "encryption", "file", "fingerprint", "hassh", "ja4", "package", "sbom", "script", "software"}
    security_kw = {"analytic", "anomaly", "assessment", "attack", "baseline", "campaign", "check", "cis", "compliance", "cve", "cvss", "cwe", "d3f", "finding", "kill_chain", "malware", "mitigation", "osint", "rule", "vulnerability"}
    cloud_kw = {"api", "cloud", "function", "job", "managed", "product", "reporter", "request", "resource", "response", "web_resource"}
    observability_kw = {"enrichment", "evidence", "graph", "logger", "metric", "node", "observable", "observation", "occurrence", "span", "trace", "transformation"}

    for obj_name, obj_data in objects.items():
        desc = obj_data.get("caption", obj_name)
        entry = (obj_name, desc)
        name_lower = obj_name.lower()

        if obj_name.startswith("win/"):
            categories["Windows"].append(entry)
        elif any(kw in name_lower for kw in identity_kw):
            categories["Identity & Access"].append(entry)
        elif any(kw in name_lower for kw in process_kw):
            categories["Process & System"].append(entry)
        elif any(kw in name_lower for kw in network_kw):
            categories["Network"].append(entry)
        elif any(kw in name_lower for kw in file_kw):
            categories["File & Data"].append(entry)
        elif any(kw in name_lower for kw in security_kw):
            categories["Security & Compliance"].append(entry)
        elif any(kw in name_lower for kw in cloud_kw):
            categories["Cloud & Infrastructure"].append(entry)
        elif any(kw in name_lower for kw in observability_kw):
            categories["Observability"].append(entry)
        else:
            categories["Other"].append(entry)

    for category, items in categories.items():
        if not items:
            continue
        lines.append(f"## {category} ({len(items)} objects)")
        lines.append("")
        for obj_name, desc in sorted(items):
            filename = obj_name.replace("/", "_")
            lines.append(f"- [`{obj_name}`](./objects/{filename}.md) - {desc}")
        lines.append("")

    return "\n".join(lines)


def generate_version(version: str) -> int:
    """Generate documentation for a specific OCSF version. Returns size in bytes."""
    # Fetch schema and profiles (profiles are in a separate API endpoint)
    schema = fetch_schema(version)
    profiles = fetch_profiles(version)
    classes = schema.get("classes", {})
    objects = schema.get("objects", {})

    print(f"  Found {len(classes)} classes, {len(objects)} objects, {len(profiles)} profiles")

    # Build class usage map
    class_usage = build_class_usage(classes, objects)

    # Create version-specific output directories
    version_dir = REFS_DIR / version
    classes_dir = version_dir / "classes"
    objects_dir = version_dir / "objects"
    profiles_dir = version_dir / "profiles"
    classes_dir.mkdir(parents=True, exist_ok=True)
    objects_dir.mkdir(parents=True, exist_ok=True)
    profiles_dir.mkdir(parents=True, exist_ok=True)

    # Generate class docs
    for class_name, class_data in classes.items():
        # Sanitize filename (handle win/ prefix)
        filename = class_name.replace("/", "_") + ".md"
        doc = generate_class_doc(class_name, class_data, objects)
        (classes_dir / filename).write_text(doc)

    # Generate object docs
    for obj_name, obj_data in objects.items():
        # Sanitize filename
        filename = obj_name.replace("/", "_") + ".md"
        doc = generate_object_doc(obj_name, obj_data, class_usage)
        (objects_dir / filename).write_text(doc)

    # Generate profile docs
    for profile_name, profile_data in profiles.items():
        # Sanitize filename (handle linux/ prefix)
        filename = profile_name.replace("/", "_") + ".md"
        doc = generate_profile_doc(profile_name, profile_data)
        (profiles_dir / filename).write_text(doc)

    # Generate overview files
    classes_overview = generate_classes_overview(version, classes)
    (version_dir / "classes-overview.md").write_text(classes_overview)

    objects_overview = generate_objects_overview(version, objects)
    (version_dir / "objects-overview.md").write_text(objects_overview)

    # Generate version index
    generate_version_index(version_dir, classes, objects, profiles)

    # Calculate total size
    total_size = sum(f.stat().st_size for f in classes_dir.glob("*.md"))
    total_size += sum(f.stat().st_size for f in objects_dir.glob("*.md"))
    total_size += sum(f.stat().st_size for f in profiles_dir.glob("*.md"))
    total_size += (version_dir / "index.md").stat().st_size
    total_size += (version_dir / "classes-overview.md").stat().st_size
    total_size += (version_dir / "objects-overview.md").stat().st_size
    return total_size


def generate_index(versions: list[str]) -> None:
    """Generate index.md listing all available versions."""
    latest = versions[-1]  # Last in list is newest
    lines = [
        "# OCSF Schema References",
        "",
        "Generated reference documentation by OCSF version.",
        "",
        "## Versions",
        "",
    ]

    # List versions in reverse order (newest first)
    for i, version in enumerate(reversed(versions)):
        label = " (latest)" if i == 0 else ""
        lines.append(f"- [{version}](./{version}/index.md){label}")

    lines.append("")

    REFS_DIR.mkdir(parents=True, exist_ok=True)
    (REFS_DIR / "index.md").write_text("\n".join(lines))


def main():
    parser = argparse.ArgumentParser(description="Generate OCSF reference docs")
    parser.add_argument("--version", help="OCSF version (default: latest stable)")
    parser.add_argument(
        "--all", action="store_true", help="Generate for all stable versions"
    )
    args = parser.parse_args()

    # Determine which versions to generate
    if args.all:
        versions = fetch_available_versions()
    elif args.version:
        versions = [args.version]
    else:
        # Default to current/latest version
        versions = [fetch_current_version()]

    total_size = 0
    generated_versions = []

    for version in versions:
        print(f"Generating documentation for OCSF {version}...")
        try:
            size = generate_version(version)
            total_size += size
            generated_versions.append(version)
            print(f"  Generated {size / 1024:.1f} KB")
        except Exception as e:
            print(f"  Error: {e}")

    # Generate index listing all versions
    if generated_versions:
        generate_index(generated_versions)
        print("Generated references/index.md")

    print(f"\nTotal: {total_size / 1024:.1f} KB of documentation")


if __name__ == "__main__":
    main()

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
            for name, atype in optional[:30]:  # Limit to first 30 for brevity
                lines.append(f"| `{name}` | {atype} |")
            if len(optional) > 30:
                lines.append(f"| ... | ({len(optional) - 30} more) |")
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


def generate_version_index(version_dir: Path, classes: dict, objects: dict) -> None:
    """Generate index.md for a specific version."""
    lines = [
        f"# OCSF {version_dir.name}",
        "",
        f"Schema reference for OCSF version {version_dir.name}.",
        "",
        f"## Classes ({len(classes)})",
        "",
    ]

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


def generate_version(version: str) -> int:
    """Generate documentation for a specific OCSF version. Returns size in bytes."""
    # Fetch schema
    schema = fetch_schema(version)
    classes = schema.get("classes", {})
    objects = schema.get("objects", {})

    print(f"  Found {len(classes)} classes and {len(objects)} objects")

    # Build class usage map
    class_usage = build_class_usage(classes, objects)

    # Create version-specific output directories
    version_dir = REFS_DIR / version
    classes_dir = version_dir / "classes"
    objects_dir = version_dir / "objects"
    classes_dir.mkdir(parents=True, exist_ok=True)
    objects_dir.mkdir(parents=True, exist_ok=True)

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

    # Generate version index
    generate_version_index(version_dir, classes, objects)

    # Calculate total size
    total_size = sum(f.stat().st_size for f in classes_dir.glob("*.md"))
    total_size += sum(f.stat().st_size for f in objects_dir.glob("*.md"))
    total_size += (version_dir / "index.md").stat().st_size
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

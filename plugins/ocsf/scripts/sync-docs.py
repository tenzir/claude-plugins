#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# dependencies = ["anthropic"]
# ///
"""Sync OCSF documentation from the ocsf-docs repository.

Downloads articles and FAQs from https://github.com/ocsf/ocsf-docs
and stores them locally for offline access.

Usage:
    uv run scripts/sync-docs.py

Environment:
    ANTHROPIC_API_KEY - Used to generate article descriptions with Claude.
                        If not set, articles section uses titles only.
"""

import json
import os
import sys
import urllib.error
import urllib.request
from pathlib import Path

import anthropic  # Installed via inline script dependencies

REPO_API = "https://api.github.com/repos/ocsf/ocsf-docs/contents"
RAW_BASE = "https://raw.githubusercontent.com/ocsf/ocsf-docs/main"

# Directories to sync
SYNC_DIRS = ["articles", "faqs"]

SCRIPT_DIR = Path(__file__).parent
SKILL_DIR = SCRIPT_DIR.parent / "skills" / "understanding-ocsf"
DOCS_DIR = SKILL_DIR / "references" / "docs"


def validate_paths() -> bool:
    """Validate that expected paths exist."""
    if not SKILL_DIR.exists():
        print(f"Error: Skill directory not found: {SKILL_DIR}", file=sys.stderr)
        return False
    skill_md = SKILL_DIR / "SKILL.md"
    if not skill_md.exists():
        print(f"Error: SKILL.md not found: {skill_md}", file=sys.stderr)
        return False
    return True


def fetch_json(url: str) -> list | dict | None:
    """Fetch JSON from URL. Returns None on error."""
    req = urllib.request.Request(url, headers={"User-Agent": "ocsf-docs-sync"})
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            return json.load(resp)
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        return None
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON from {url}: {e}", file=sys.stderr)
        return None


def fetch_text(url: str) -> str | None:
    """Fetch text content from URL. Returns None on error."""
    req = urllib.request.Request(url, headers={"User-Agent": "ocsf-docs-sync"})
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            return resp.read().decode("utf-8")
    except urllib.error.URLError as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        return None


def extract_title(content: str, fallback: str) -> str:
    """Extract title from markdown content's first heading, or use fallback."""
    for line in content.splitlines():
        if line.startswith("# "):
            return line[2:].strip()
    return fallback


def sync_directory(dirname: str) -> int:
    """Sync a directory from the ocsf-docs repo. Returns file count."""
    print(f"Syncing {dirname}/...")

    # Get directory listing
    contents = fetch_json(f"{REPO_API}/{dirname}")
    if contents is None:
        print(f"  Skipping {dirname}/ due to fetch error")
        return 0

    # Create local directory
    local_dir = DOCS_DIR / dirname
    local_dir.mkdir(parents=True, exist_ok=True)

    expected_files = {
        item["name"]
        for item in contents
        if item["type"] == "file"
        and item["name"].endswith(".md")
        and item["name"] != "README.md"
    }
    for md_file in local_dir.glob("*.md"):
        if md_file.name not in expected_files:
            md_file.unlink()
            print(f"  Removed stale {md_file.name}")

    count = 0
    for item in contents:
        if item["type"] != "file" or not item["name"].endswith(".md"):
            continue
        if item["name"] == "README.md":
            continue  # Skip READMEs - they have broken links to upstream paths

        # Fetch and save file
        content = fetch_text(f"{RAW_BASE}/{dirname}/{item['name']}")
        if content is None:
            print(f"  Skipping {item['name']} due to fetch error")
            continue
        local_path = local_dir / item["name"]
        local_path.write_text(content)
        print(f"  {item['name']}")
        count += 1

    return count


def extract_faq_questions(faq_path: Path) -> list[str]:
    """Extract question headings from schema-faq.md."""
    if not faq_path.exists():
        return []

    questions = []
    for line in faq_path.read_text().splitlines():
        if line.startswith("## "):
            questions.append(line[3:].strip())
    return questions


def generate_articles_section(articles_dir: Path) -> str:
    """Generate the Articles section using Claude.

    Makes one API call with all article content to generate descriptions.
    Falls back to a simple list if API unavailable.
    """
    articles = sorted(
        [f for f in articles_dir.glob("*.md") if f.name != "README.md"]
    )

    if not articles:
        return "### Articles\n\nNo articles available.\n"

    # Build article summaries for Claude
    article_data = []
    for article in articles:
        content = article.read_text()
        fallback_title = article.stem.replace("-", " ").title()
        article_data.append({
            "filename": article.name,
            "title": extract_title(content, fallback_title),
            "content": content[:3000],  # Truncate for API
        })

    if not os.environ.get("ANTHROPIC_API_KEY"):
        print("  No ANTHROPIC_API_KEY, using titles only")
        return generate_simple_articles_section(article_data)

    # Build prompt
    articles_text = "\n\n---\n\n".join(
        f"**{a['filename']}**\n{a['content']}" for a in article_data
    )

    prompt = f"""Generate a markdown "Articles" section for OCSF documentation.

For each article, write a 3-4 sentence paragraph that:
1. Explains what the article covers
2. Lists specific scenarios/use cases when to read it
3. Includes key terms and trigger words that help match user queries

Output format (markdown):
## Articles

### [Title](./references/docs/articles/filename.md)

3-4 sentences with trigger words like "profiles", "mix-in", "augmentation", etc.
Include phrases like "Read this when..." or "Useful for..." to aid discovery.

### [Another Title](./references/docs/articles/another.md)

Another paragraph...

Articles to summarize:

{articles_text}"""

    try:
        client = anthropic.Anthropic()
        message = client.messages.create(
            model="claude-haiku-4-5",
            max_tokens=2000,
            messages=[{"role": "user", "content": prompt}],
        )
        section = message.content[0].text.strip()
        print("  Generated articles section with Claude")
        return section + "\n"
    except anthropic.APIError as e:
        print(f"  Claude API error: {e}, using fallback", file=sys.stderr)
        return generate_simple_articles_section(article_data)


def generate_simple_articles_section(article_data: list[dict]) -> str:
    """Generate a simple articles section without Claude descriptions."""
    lines = ["## Articles", ""]
    for a in article_data:
        link = f"[{a['title']}](./references/docs/articles/{a['filename']})"
        lines.append(f"### {link}")
        lines.append("")
    return "\n".join(lines)


def update_skill_articles_index(articles_dir: Path) -> None:
    """Update the articles section in SKILL.md."""
    skill_path = SKILL_DIR / "SKILL.md"
    if not skill_path.exists() or not articles_dir.exists():
        return

    content = skill_path.read_text()

    # Find the articles section
    start_marker = "## Articles"
    start_idx = content.find(start_marker)
    if start_idx == -1:
        print("Could not find Articles section in SKILL.md, skipping update")
        return

    # Generate new section
    new_section = generate_articles_section(articles_dir)

    # Replace from start_marker to end of file
    new_content = content[:start_idx] + new_section
    skill_path.write_text(new_content)
    print(f"Updated SKILL.md articles section")


def update_skill_faq_index(questions: list[str]) -> None:
    """Update the FAQ questions list in SKILL.md."""
    skill_path = SKILL_DIR / "SKILL.md"
    if not skill_path.exists():
        print("SKILL.md not found, skipping FAQ index update")
        return

    content = skill_path.read_text()

    # Find the FAQ section and replace the questions list
    start_marker = "Read [schema-faq.md](./references/docs/faqs/schema-faq.md) for questions like:"
    end_marker = "## Articles"

    start_idx = content.find(start_marker)
    end_idx = content.find(end_marker)

    if start_idx == -1 or end_idx == -1:
        print("Could not find FAQ section markers in SKILL.md, skipping update")
        return

    # Build new questions list
    questions_list = "\n".join(f"- {q}" for q in questions)
    new_section = f"{start_marker}\n\n{questions_list}\n\n"

    # Replace the section
    new_content = content[:start_idx] + new_section + content[end_idx:]
    skill_path.write_text(new_content)
    print(f"Updated SKILL.md with {len(questions)} FAQ questions")


def generate_index() -> None:
    """Generate an index.md listing all synced docs."""
    index_path = DOCS_DIR / "index.md"

    lines = [
        "# OCSF Documentation",
        "",
        "Synced from [ocsf/ocsf-docs](https://github.com/ocsf/ocsf-docs).",
        "",
    ]

    for dirname in SYNC_DIRS:
        local_dir = DOCS_DIR / dirname
        if not local_dir.exists():
            continue

        lines.append(f"## {dirname.title()}")
        lines.append("")

        for md_file in sorted(local_dir.glob("*.md")):
            content = md_file.read_text()
            fallback_title = md_file.stem.replace("-", " ").replace("_", " ").title()
            title = extract_title(content, fallback_title)
            lines.append(f"- [{title}](./{dirname}/{md_file.name})")

        lines.append("")

    index_path.write_text("\n".join(lines))
    print("Generated docs/index.md")


def main():
    print("Syncing OCSF documentation...")

    # Validate paths before proceeding
    if not validate_paths():
        sys.exit(1)

    total = 0
    for dirname in SYNC_DIRS:
        total += sync_directory(dirname)

    if total == 0:
        print("No files synced (network errors or empty directories)")
        sys.exit(1)

    generate_index()

    # Update FAQ index in SKILL.md
    faq_path = DOCS_DIR / "faqs" / "schema-faq.md"
    questions = extract_faq_questions(faq_path)
    if questions:
        update_skill_faq_index(questions)

    # Update articles index in SKILL.md
    articles_dir = DOCS_DIR / "articles"
    update_skill_articles_index(articles_dir)

    print(f"\nSynced {total} files")


if __name__ == "__main__":
    main()

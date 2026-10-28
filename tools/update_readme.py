#!/usr/bin/env python3

import json
import re
from html import escape
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PORTS_DIR = ROOT / "ports"
TEMPLATE_PATH = ROOT / "README.tpl.md"
README_PATH = ROOT / "README.md"
FORKS_PATH = ROOT / "docs" / "info" / "forks.json"

PORTS_TABLES_COLUMNS = 6

GENERATED_NOTICE = (
    "<!-- This file is generated from README.tpl.md by tools/update_readme.py. "
    "Do not edit it directly. -->\n\n"
)


class Markers:
    TOTAL_PORTS_COUNT = "TOTAL_PORTS_COUNT"
    PORTS_TABLE_CONTENT = "PORTS_TABLE_CONTENT"
    PORTS_FORKS_SOURCE_SECTION = "PORTS_FORKS_SOURCE_SECTION"


def load_ports():
    standalone = []
    requires_data = []

    for port_dir in PORTS_DIR.iterdir():
        if not port_dir.is_dir():
            continue

        config_path = port_dir / "config.json"
        if not config_path.is_file():
            continue

        with config_path.open(encoding="utf-8") as f:
            config = json.load(f)

        port = {
            "name": config["name"],
            "guide": config.get(
                "setup_guide",
                f"docs/setup/{port_dir.name}.md",
            ),
            "boxart": f"ports/{port_dir.name}/boxart.png",
            "requires_data": (port_dir / ".requires_game_data").is_file(),
        }

        if port["requires_data"]:
            requires_data.append(port)
        else:
            standalone.append(port)

    standalone.sort(key=lambda p: p["name"].casefold())
    requires_data.sort(key=lambda p: p["name"].casefold())

    return standalone, requires_data


def render_table(ports):
    lines = ["<table>"]

    for i in range(0, len(ports), PORTS_TABLES_COLUMNS):
        lines.append("  <tr>")

        for port in ports[i : i + PORTS_TABLES_COLUMNS]:
            name = escape(port["name"])
            guide = escape(port["guide"], quote=True)
            boxart = escape(port["boxart"], quote=True)

            lines.append(
                f'    <td align="center">'
                f'<a href="{guide}">'
                f'<img src="{boxart}" width="150" alt="{name} floppy box art">'
                f"<br><strong>{name}</strong>"
                f"</a>"
                f"</td>"
            )

        lines.append("  </tr>")

    lines.append("</table>")
    return "\n".join(lines)


def render_ports_tables(standalone, requires_data):
    sections = []

    if standalone:
        sections += ["### Standalone ports", render_table(standalone)]
    if requires_data:
        sections += ["### Ports requiring game data", render_table(requires_data)]

    return "\n\n".join(sections)


def md_text(text):
    """Escape characters that would break a Markdown link label."""
    return text.replace("[", r"\[").replace("]", r"\]")


def load_forks():
    if not FORKS_PATH.is_file():
        raise FileNotFoundError(f"Missing forks file: {FORKS_PATH}")

    with FORKS_PATH.open(encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, dict):
        raise ValueError("forks.json must be a JSON object")

    data.pop("$schema", None)
    return data


def render_forks_section(forks):
    lines = ["## Source forks", ""]
    lines.append(
        "Some ports are built from upstream game forks adapted for TreeFrogUI. "
        "Their sources are listed below."
    )

    for author in sorted(forks, key=str.casefold):
        ports = forks[author].get("ports", [])
        if not ports:
            continue

        entries = []
        for port in ports:
            url = port["url"]
            title = port.get("title") or url.rstrip("/").split("/")[-1]
            entries.append((title, url, port["name"]))
        entries.sort(key=lambda e: e[0].casefold())

        lines += ["", f"### {md_text(author)}", ""]
        for title, url, name in entries:
            lines.append(f"- [{md_text(title)}]({url}) -- {name}")

    return "\n".join(lines)


def render_template(template, values):
    result = template

    for marker, value in values.items():
        result = result.replace("{{" + marker + "}}", value)

    leftover = re.findall(r"\{\{\s*[A-Z_]+\s*\}\}", result)
    if leftover:
        raise ValueError(
            f"Unreplaced placeholders in template: {sorted(set(leftover))}"
        )

    return result


def main():
    if not TEMPLATE_PATH.is_file():
        raise FileNotFoundError(f"Missing template: {TEMPLATE_PATH}")

    standalone, requires_data = load_ports()
    forks = load_forks()

    values = {
        Markers.TOTAL_PORTS_COUNT: str(len(standalone) + len(requires_data)),
        Markers.PORTS_TABLE_CONTENT: render_ports_tables(standalone, requires_data),
        Markers.PORTS_FORKS_SOURCE_SECTION: render_forks_section(forks),
    }

    template = TEMPLATE_PATH.read_text(encoding="utf-8")
    updated = GENERATED_NOTICE + render_template(template, values)

    current = README_PATH.read_text(encoding="utf-8") if README_PATH.is_file() else None

    if updated == current:
        print("README.md is already up to date.")
        return

    README_PATH.write_text(updated, encoding="utf-8")

    print(
        f"README.md updated successfully! "
        f"({len(standalone)} standalone, "
        f"{len(requires_data)} requiring game data)"
    )


if __name__ == "__main__":
    main()

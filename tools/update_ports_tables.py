#!/usr/bin/env python3

import json
from html import escape
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PORTS_DIR = ROOT / "ports"
COLUMNS = 6


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

    for i in range(0, len(ports), COLUMNS):
        lines.append("  <tr>")

        for port in ports[i : i + COLUMNS]:
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


def main():
    standalone, requires_data = load_ports()

    output = "\n\n".join(
        [
            "## Standalone ports",
            render_table(standalone),
            "## Ports requiring game data",
            render_table(requires_data),
        ]
    )

    readme_path = ROOT / "README.md"
    readme = readme_path.read_text(encoding="utf-8")

    start_marker = "## Supported ports"
    end_marker = "## How to install"

    if readme.count(start_marker) != 1 or readme.count(end_marker) != 1:
        raise ValueError("README.md section markers missing or duplicated")

    before, remainder = readme.split(start_marker, 1)
    _, after = remainder.split(end_marker, 1)

    updated = before + start_marker + "\n\n" + output + "\n\n" + end_marker + after

    if updated == readme:
        print("README.md is already up to date.")
        return

    readme_path.write_text(updated, encoding="utf-8")

    print(
        f"README.md updated successfully! "
        f"({len(standalone)} standalone, "
        f"{len(requires_data)} requiring game data)"
    )


if __name__ == "__main__":
    main()

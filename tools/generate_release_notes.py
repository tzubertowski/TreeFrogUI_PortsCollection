#!/usr/bin/env python3
"""Generate standard GitHub notes with port author and fork-source credits."""

import json
import os
from pathlib import Path
from urllib.error import HTTPError
from urllib.parse import urlencode
from urllib.request import Request, urlopen

ROOT = Path(__file__).resolve().parents[1]
API = "https://api.github.com"
TOKEN = os.environ["GH_TOKEN"]
REPOSITORY = os.environ["GITHUB_REPOSITORY"]


def api(path, method="GET", payload=None):
    data = json.dumps(payload).encode() if payload is not None else None
    request = Request(
        API + path,
        data=data,
        method=method,
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {TOKEN}",
            "X-GitHub-Api-Version": "2022-11-28",
            "Content-Type": "application/json",
        },
    )
    with urlopen(request) as response:
        return json.load(response)


def api_pages(path, params):
    page = 1
    while True:
        query = urlencode({**params, "per_page": 100, "page": page})
        items = api(f"{path}?{query}")
        yield from items
        if len(items) < 100:
            return
        page += 1


def previous_release():
    try:
        return api(f"/repos/{REPOSITORY}/releases/latest")
    except HTTPError as error:
        if error.code == 404:
            return None
        raise


def port_metadata():
    ports = {}
    for config_path in sorted((ROOT / "ports").glob("*/config.json")):
        config = json.loads(config_path.read_text())
        ports[config["id"]] = config["name"]

    forks = json.loads((ROOT / "docs/info/forks.json").read_text())
    sources = {
        port["name"]: port
        for author, data in forks.items()
        if author != "$schema"
        for port in data["ports"]
    }
    return ports, sources


def merged_prs(published_at):
    pulls = api_pages(
        f"/repos/{REPOSITORY}/pulls",
        {"state": "closed", "base": "main", "sort": "updated", "direction": "desc"},
    )
    for pull in pulls:
        merged_at = pull.get("merged_at")
        if merged_at and (published_at is None or merged_at > published_at):
            yield pull


def changed_ports(pull, ports):
    paths = api_pages(
        f"/repos/{REPOSITORY}/pulls/{pull['number']}/files", {}
    )
    ids = {
        parts[1]
        for file in paths
        if len(parts := file["filename"].split("/")) > 2 and parts[0] == "ports"
    }
    return sorted((port_id, ports[port_id]) for port_id in ids if port_id in ports)


def main():
    release = previous_release()
    payload = {
        "tag_name": os.environ["RELEASE_TAG"],
        "target_commitish": os.environ["GITHUB_SHA"],
    }
    if release:
        payload["previous_tag_name"] = release["tag_name"]
    body = api(f"/repos/{REPOSITORY}/releases/generate-notes", "POST", payload)["body"]

    ports, sources = port_metadata()
    credits = []
    for pull in merged_prs(release["published_at"] if release else None):
        author = pull["user"]["login"]
        for _, name in changed_ports(pull, ports):
            line = f"- **{name}** — Ported by: @{author}"
            if source := sources.get(name):
                line += f", Original Source: {source['url']}"
            line += f" ([PR #{pull['number']}]({pull['html_url']}))"
            credits.append(line)

    if credits:
        body = body.rstrip() + "\n\n## Port attributions\n\n" + "\n".join(credits) + "\n"
    Path(os.environ["RELEASE_NOTES_PATH"]).write_text(body)


if __name__ == "__main__":
    main()

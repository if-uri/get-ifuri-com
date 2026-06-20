#!/usr/bin/env python3
# Author: Tom Sapletta · https://tom.sapletta.com
# Part of the ifURI solution.

from __future__ import annotations

import re
import sys
from html.parser import HTMLParser
from pathlib import Path


class PageParser(HTMLParser):
    def __init__(self) -> None:
        super().__init__()
        self.ids: set[str] = set()
        self.copy_targets: list[str] = []
        self.links: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        data = {name: value or "" for name, value in attrs}
        if data.get("id"):
            self.ids.add(data["id"])
        if data.get("data-copy-target"):
            self.copy_targets.append(data["data-copy-target"])
        if tag == "a" and data.get("href"):
            self.links.append(data["href"])


def read_html() -> str:
    if len(sys.argv) > 2:
        raise SystemExit("usage: check_site.py [index.html|-]")
    if len(sys.argv) == 2 and sys.argv[1] == "-":
        return sys.stdin.read()
    path = Path(sys.argv[1]) if len(sys.argv) == 2 else Path("index.html")
    return path.read_text(encoding="utf-8")


def main() -> int:
    html = read_html()
    parser = PageParser()
    parser.feed(html)
    errors: list[str] = []

    for target in parser.copy_targets:
        if target not in parser.ids:
            errors.append(f"missing copy target id: {target}")

    required = {
        "https://get.ifuri.com/host.sh",
        "https://get.ifuri.com/node.sh",
        "https://get.ifuri.com/node.ps1",
        "https://raw.githubusercontent.com/if-uri/get/main/host.sh",
        "https://raw.githubusercontent.com/if-uri/get/main/node.sh",
    }
    for url in sorted(required):
        if url not in html:
            errors.append(f"missing required URL: {url}")

    if not re.search(r"<h1>.*hosta albo node", html, flags=re.S):
        errors.append("H1 should mention both host and node")

    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    print(f"index.html ok: {len(parser.copy_targets)} copy buttons, {len(parser.links)} links")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

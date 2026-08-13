#!/usr/bin/env python3
"""Hunt complaints via Bing HTML.

Claude Code WebSearch is an Anthropic server tool. Proxies and some client
builds return "Did 0 searches" / "Content block not found" instead of results.
This script runs locally and prints title + URL + snippet.
"""
from __future__ import annotations

import html as htmlmod
import re
import sys
import urllib.error
import urllib.parse
import urllib.request

UA = (
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
)
ENDPOINTS = (
    "https://www.bing.com/search",
    "https://cn.bing.com/search",
)
TAG = re.compile(r"<[^>]+>")
WS = re.compile(r"\s+")
H2 = re.compile(
    r'<h2[^>]*>\s*<a[^>]+href="([^"]+)"[^>]*>(.*?)</a>',
    re.I | re.S,
)
CITE = re.compile(r"<cite[^>]*>(.*?)</cite>", re.I | re.S)
SNIP = re.compile(
    r'<p class="b_lineclamp[^"]*"[^>]*>(.*?)</p>',
    re.I | re.S,
)


def text(blob: str) -> str:
    return WS.sub(" ", htmlmod.unescape(TAG.sub("", blob))).strip()


def fetch(url: str) -> str:
    req = urllib.request.Request(url, headers={"User-Agent": UA, "Accept-Language": "en,zh;q=0.8"})
    with urllib.request.urlopen(req, timeout=20) as resp:
        return resp.read().decode("utf-8", "replace")


def parse(page: str) -> list[dict[str, str]]:
    rows: list[dict[str, str]] = []
    seen: set[str] = set()
    for block in re.split(r'<li class="b_algo"', page)[1:]:
        h2 = H2.search(block[:6000])
        if not h2:
            continue
        href = htmlmod.unescape(h2.group(1))
        if href.startswith("/"):
            continue
        title = text(h2.group(2))
        cite = text(CITE.search(block[:6000]).group(1)) if CITE.search(block[:6000]) else ""
        snippet = text(SNIP.search(block[:8000]).group(1)) if SNIP.search(block[:8000]) else ""
        key = href.split("?")[0]
        if not title or key in seen:
            continue
        seen.add(key)
        rows.append({"title": title, "url": href, "cite": cite, "snippet": snippet})
    return rows


def params(query: str) -> dict[str, str]:
    out = {"q": query}
    # Geo-IP Bing defaults to dictionaries unless the market is explicit.
    out["mkt"] = "zh-CN" if re.search(r"[\u4e00-\u9fff]", query) else "en-US"
    return out


def hunt(query: str) -> list[dict[str, str]]:
    q = urllib.parse.urlencode(params(query))
    last_err: Exception | None = None
    for base in ENDPOINTS:
        try:
            rows = parse(fetch(f"{base}?{q}"))
        except (urllib.error.URLError, TimeoutError, OSError) as err:
            last_err = err
            continue
        if rows:
            return rows
    if last_err:
        raise last_err
    return []


def main(argv: list[str]) -> int:
    queries = [a for a in argv[1:] if a.strip()]
    if not queries:
        print("usage: hunt.py <query> [query...]", file=sys.stderr)
        return 2
    failed = 0
    for query in queries:
        print(f"## {query}")
        try:
            rows = hunt(query)
        except Exception as err:
            print(f"ERROR: {err}")
            failed += 1
            print()
            continue
        if not rows:
            print("ERROR: 0 results")
            failed += 1
            print()
            continue
        for i, row in enumerate(rows[:8], 1):
            print(f"{i}. {row['title']}")
            print(f"   URL: {row['url']}")
            if row["cite"]:
                print(f"   Cite: {row['cite']}")
            if row["snippet"]:
                print(f"   Snippet: {row['snippet']}")
        print()
    return 1 if failed == len(queries) else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))

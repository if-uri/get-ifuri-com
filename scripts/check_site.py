#!/usr/bin/env python3
"""Validate get.ifuri.com (ifURI app download page): structure + key content."""
import html.parser, pathlib, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
REQUIRED = ["github.com/if-uri/app", "ifuri-ecobar.js", "get.urirun.com",
            "Download the ifURI app", "pip install", 'rel="canonical"']

class Bal(html.parser.HTMLParser):
    def __init__(self): super().__init__(); self.n={}
    def handle_starttag(self,t,a):
        if t in ("html","head","body","main","footer"): self.n[t]=self.n.get(t,0)+1
    def handle_endtag(self,t):
        if t in ("html","head","body","main","footer"): self.n[t]=self.n.get(t,0)-1

def main():
    errs=0
    idx=ROOT/"index.html"
    if not idx.is_file(): print("FAIL: index.html missing"); return 1
    t=idx.read_text(encoding="utf-8")
    p=Bal(); p.feed(t)
    for tag,d in p.n.items():
        if d!=0: print(f"FAIL: unbalanced <{tag}> ({d})"); errs+=1
    for n in REQUIRED:
        if n not in t: print(f"FAIL: index.html missing {n}"); errs+=1
    if not (ROOT/".htaccess").is_file(): print("FAIL: .htaccess (node/host redirect) missing"); errs+=1
    print(f"site checked, {errs} error(s)")
    return 1 if errs else 0

if __name__=="__main__": sys.exit(main())

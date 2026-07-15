# get-ifuri-com

get-ifuri-com

## Contents

- [Metadata](#metadata)
- [Architecture](#architecture)
- [Workflows](#workflows)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Makefile Targets](#makefile-targets)
- [Code Analysis](#code-analysis)
- [Call Graph](#call-graph)
- [Intent](#intent)

## Metadata

- **name**: `get-ifuri-com`
- **version**: `0.0.0`
- **ecosystem**: SUMD + DOQL + testql + taskfile
- **generated_from**: Makefile, app.doql.less, project/(3 analysis files)

## Architecture

```
SUMD (description) → DOQL/source (code) → taskfile (automation) → testql (verification)
```

### DOQL Application Declaration (`app.doql.less`)

```less markpact:doql path=app.doql.less
// LESS format — define @variables here as needed

app {
  name: get-ifuri-com;
  version: 0.1.0;
}

interface[type="web"] {
  type: spa;
  framework: static;
}

workflow[name="serve"] {
  trigger: manual;
  step-1: run cmd=python3 -m http.server $(PORT);
}

workflow[name="test"] {
  trigger: manual;
  step-1: run cmd=python3 scripts/check_site.py;
}

workflow[name="deploy"] {
  trigger: manual;
  step-1: run cmd=bash scripts/deploy-plesk.sh;
}

deploy {
  target: makefile;
}

environment[name="local"] {
  runtime: python;
}
```

## Workflows

## Configuration

```yaml
project:
  name: get-ifuri-com
  version: 0.0.0
  env: local
```

## Deployment

```bash markpact:run
pip install get-ifuri-com

# development install
pip install -e .[dev]
```

## Makefile Targets

- `help`
- `serve`
- `test`
- `deploy`

## Code Analysis

### `project/map.toon.yaml`

```toon markpact:analysis path=project/map.toon.yaml
# get-ifuri-com | 8f 266L | xml:1,txt:1,javascript:1,shell:3,python:1 | 2026-07-14
# generated in 0.00s
# stats: 16 func | 0 cls | 8 mod | CC̄=3.2 | critical:0 | cycles:0
# alerts[0]: none
# hotspots[1]: main fan=7
# evolution: baseline
# Keys: M=modules, D=details, i=imports, e=exports, c=classes, f=functions, m=methods
M[8]:
  Makefile,10
  ifuri-ecobar.js,108
  project.sh,66
  robots.txt,3
  scripts/check_site.py,29
  scripts/deploy-plesk.sh,42
  sitemap.xml,4
  tree.sh,4
D:
  ifuri-ecobar.js:
    e: params,lang,view,host,curView,isActive,esc,navHTML,label,hostEl,sr,p
    params()
    lang()
    view()
    host()
    curView()
    isActive()
    esc()
    navHTML()
    label()
    hostEl()
    sr()
    p()
  scripts/check_site.py:
    e: Bal,main
    Bal(html.parser.HTMLParser): __init__(0),handle_starttag(2),handle_endtag(1)
    main()
  sitemap.xml:
  robots.txt:
  Makefile:
  tree.sh:
  project.sh:
  scripts/deploy-plesk.sh:
```

### `project/logic.pl`

```prolog markpact:analysis path=project/logic.pl
% ── Project Metadata ─────────────────────────────────────
project_metadata('get-ifuri-com', '0.0.0', 'python').

% ── Project Files ────────────────────────────────────────
project_file('app.doql.less', 35, 'less').
project_file('ifuri-ecobar.js', 109, 'javascript').
project_file('project.sh', 66, 'shell').
project_file('scripts/check_site.py', 30, 'python').
project_file('scripts/deploy-plesk.sh', 43, 'shell').
project_file('tree.sh', 5, 'shell').

% ── Python Functions ─────────────────────────────────────
python_function('scripts/check_site.py', 'main', 0, 8, 6).

% ── Python Classes ───────────────────────────────────────
python_class('scripts/check_site.py', 'Bal').
python_method('Bal', '__init__', 0, 1, 2).
python_method('Bal', 'handle_starttag', 2, 2, 1).
python_method('Bal', 'handle_endtag', 1, 2, 1).

% ── Dependencies ─────────────────────────────────────────

% ── Makefile Targets ─────────────────────────────────────
makefile_target('help', '').
makefile_target('serve', '').
makefile_target('test', '').
makefile_target('deploy', '').

% ── Taskfile Tasks ───────────────────────────────────────

% ── Environment Variables ────────────────────────────────

% ── TestQL Scenarios ─────────────────────────────────────

% ── Semantic Facts from SUMD.md ──────────────────────────
```

## Call Graph

*3 nodes · 2 edges · 1 modules · CC̄=3.2*

### Hubs (by degree)

| Function | CC | in | out | total |
|----------|----|----|-----|-------|
| `navHTML` *(in ifuri-ecobar)* | 3 | 0 | 4 | **4** |
| `esc` *(in ifuri-ecobar)* | 1 | 1 | 2 | **3** |
| `isActive` *(in ifuri-ecobar)* | 9 | 1 | 1 | **2** |

```toon markpact:analysis path=project/calls.toon.yaml
# code2llm call graph | /home/tom/github/if-uri/get-ifuri-com
# generated in 0.00s
# nodes: 3 | edges: 2 | modules: 1
# CC̄=3.2

HUBS[20]:
  ifuri-ecobar.navHTML
    CC=3  in:0  out:4  total:4
  ifuri-ecobar.esc
    CC=1  in:1  out:2  total:3
  ifuri-ecobar.isActive
    CC=9  in:1  out:1  total:2

MODULES:
  ifuri-ecobar  [3 funcs]
    esc  CC=1  out:2
    isActive  CC=9  out:1
    navHTML  CC=3  out:4

EDGES:
  ifuri-ecobar.navHTML → ifuri-ecobar.esc
  ifuri-ecobar.navHTML → ifuri-ecobar.isActive
```

## Intent

get-ifuri-com

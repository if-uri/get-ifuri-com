# get-ifuri-com

SUMD - Structured Unified Markdown Descriptor for AI-aware project refactorization

## Contents

- [Metadata](#metadata)
- [Architecture](#architecture)
- [Workflows](#workflows)
- [Call Graph](#call-graph)
- [Refactoring Analysis](#refactoring-analysis)
- [Intent](#intent)

## Metadata

- **name**: `get-ifuri-com`
- **version**: `0.0.0`
- **ecosystem**: SUMD + DOQL + testql + taskfile
- **generated_from**: Makefile, app.doql.less, project/(5 analysis files)

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

## Refactoring Analysis

*Pre-refactoring snapshot — use this section to identify targets. Generated from `project/` toon files.*

### Call Graph & Complexity (`project/calls.toon.yaml`)

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

### Code Analysis (`project/analysis.toon.yaml`)

```toon markpact:analysis path=project/analysis.toon.yaml
# code2llm | 8f 266L | shell:3,xml:1,txt:1,javascript:1,python:1 | 2026-07-14
# generated in 0.00s
# CC̅=3.2 | critical:0/16 | dups:0 | cycles:0

HEALTH[0]: ok

REFACTOR[0]: none needed

PIPELINES[9]:
  [1] Src [host]: host
      PURITY: 100% pure
  [2] Src [curView]: curView
      PURITY: 100% pure
  [3] Src [navHTML]: navHTML → esc
      PURITY: 100% pure
  [4] Src [hostEl]: hostEl
      PURITY: 100% pure
  [5] Src [sr]: sr
      PURITY: 100% pure
  [6] Src [__init__]: __init__
      PURITY: 100% pure
  [7] Src [handle_starttag]: handle_starttag
      PURITY: 100% pure
  [8] Src [handle_endtag]: handle_endtag
      PURITY: 100% pure
  [9] Src [main]: main
      PURITY: 100% pure

LAYERS:
  ./                              CC̄=3.2    ←in:0  →out:0
  │ ifuri-ecobar.js            108L  0C   12m  CC=9      ←0
  │ project.sh                  66L  0C    0m  CC=0.0    ←0
  │ Makefile                    10L  0C    0m  CC=0.0    ←0
  │ sitemap.xml                  4L  0C    0m  CC=0.0    ←0
  │ tree.sh                      4L  0C    0m  CC=0.0    ←0
  │ robots.txt                   3L  0C    0m  CC=0.0    ←0
  │
  scripts/                        CC̄=3.2    ←in:0  →out:0
  │ deploy-plesk.sh             42L  0C    0m  CC=0.0    ←0
  │ check_site                  29L  1C    4m  CC=8      ←0
  │

COUPLING: no cross-package imports detected

EXTERNAL:
  validation: run `vallm batch .` → validation.toon
  duplication: run `redup scan .` → duplication.toon
```

### Duplication (`project/duplication.toon.yaml`)

```toon markpact:analysis path=project/duplication.toon.yaml
# redup/duplication | 0 groups | 4f 220L | 2026-07-14

SUMMARY:
  files_scanned: 4
  total_lines:   220
  dup_groups:    0
  dup_fragments: 0
  saved_lines:   0
  scan_ms:       19
```

### Evolution / Churn (`project/evolution.toon.yaml`)

```toon markpact:analysis path=project/evolution.toon.yaml
# code2llm/evolution | 12 func | 1f | 2026-07-14
# generated in 0.00s

NEXT[0]: no refactoring needed

RISKS[0]: none

METRICS-TARGET:
  CC̄:          3.2 → ≤2.2
  max-CC:      9 → ≤4
  god-modules: 0 → 0
  high-CC(≥15): 0 → ≤0
  hub-types:   0 → ≤0

PATTERNS (language parser shared logic):
  _extract_declarations() in base.py — unified extraction for:
    - TypeScript: interfaces, types, classes, functions, arrow funcs
    - PHP: namespaces, traits, classes, functions, includes
    - Ruby: modules, classes, methods, requires
    - C++: classes, structs, functions, #includes
    - C#: classes, interfaces, methods, usings
    - Java: classes, interfaces, methods, imports
    - Go: packages, functions, structs
    - Rust: modules, functions, traits, use statements

  Shared regex patterns per language:
    - import: language-specific import/require/using patterns
    - class: class/struct/trait declarations with inheritance
    - function: function/method signatures with visibility
    - brace_tracking: for C-family languages ({ })
    - end_keyword_tracking: for Ruby (module/class/def...end)

  Benefits:
    - Consistent extraction logic across all languages
    - Reduced code duplication (~70% reduction in parser LOC)
    - Easier maintenance: fix once, apply everywhere
    - Standardized FunctionInfo/ClassInfo models

HISTORY:
  (first run — no previous data)
```

## Intent

get-ifuri-com

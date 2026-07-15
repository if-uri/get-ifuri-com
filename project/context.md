# System Architecture Analysis
<!-- generated in 0.00s -->

## Overview

- **Project**: /home/tom/github/if-uri/get-ifuri-com
- **Primary Language**: shell
- **Languages**: shell: 3, xml: 1, txt: 1, javascript: 1, python: 1
- **Analysis Mode**: static
- **Total Functions**: 16
- **Total Classes**: 1
- **Modules**: 8
- **Entry Points**: 14

## Architecture by Module

### ifuri-ecobar
- **Functions**: 12
- **File**: `ifuri-ecobar.js`

### scripts.check_site
- **Functions**: 4
- **Classes**: 1
- **File**: `check_site.py`

## Key Entry Points

Main execution flows into the system:

### scripts.check_site.main
- **Calls**: idx.read_text, Bal, p.feed, p.n.items, print, idx.is_file, print, None.is_file

### ifuri-ecobar.navHTML
- **Calls**: ifuri-ecobar.map, ifuri-ecobar.esc, ifuri-ecobar.isActive, ifuri-ecobar.join

### scripts.check_site.Bal.__init__
- **Calls**: None.__init__, super

### ifuri-ecobar.host
- **Calls**: ifuri-ecobar.test

### ifuri-ecobar.curView
- **Calls**: ifuri-ecobar.test

### ifuri-ecobar.hostEl
- **Calls**: ifuri-ecobar.attachShadow

### ifuri-ecobar.sr
- **Calls**: ifuri-ecobar.attachShadow

### scripts.check_site.Bal.handle_starttag
- **Calls**: self.n.get

### scripts.check_site.Bal.handle_endtag
- **Calls**: self.n.get

### ifuri-ecobar.params

### ifuri-ecobar.lang

### ifuri-ecobar.view

### ifuri-ecobar.label

### ifuri-ecobar.p

## Process Flows

Key execution flows identified:

### Flow 1: main
```
main [scripts.check_site]
```

### Flow 2: navHTML
```
navHTML [ifuri-ecobar]
  └─> esc
```

### Flow 3: __init__
```
__init__ [scripts.check_site.Bal]
```

### Flow 4: host
```
host [ifuri-ecobar]
```

### Flow 5: curView
```
curView [ifuri-ecobar]
```

### Flow 6: hostEl
```
hostEl [ifuri-ecobar]
```

### Flow 7: sr
```
sr [ifuri-ecobar]
```

### Flow 8: handle_starttag
```
handle_starttag [scripts.check_site.Bal]
```

### Flow 9: handle_endtag
```
handle_endtag [scripts.check_site.Bal]
```

### Flow 10: params
```
params [ifuri-ecobar]
```

## Key Classes

### scripts.check_site.Bal
- **Methods**: 3
- **Key Methods**: scripts.check_site.Bal.__init__, scripts.check_site.Bal.handle_starttag, scripts.check_site.Bal.handle_endtag
- **Inherits**: html.parser.HTMLParser

## Data Transformation Functions

Key functions that process and transform data:

## Public API Surface

Functions exposed as public API (no underscore prefix):

- `scripts.check_site.main` - 11 calls
- `ifuri-ecobar.navHTML` - 4 calls
- `ifuri-ecobar.esc` - 2 calls
- `ifuri-ecobar.host` - 1 calls
- `ifuri-ecobar.curView` - 1 calls
- `ifuri-ecobar.isActive` - 1 calls
- `ifuri-ecobar.hostEl` - 1 calls
- `ifuri-ecobar.sr` - 1 calls
- `scripts.check_site.Bal.handle_starttag` - 1 calls
- `scripts.check_site.Bal.handle_endtag` - 1 calls
- `ifuri-ecobar.params` - 0 calls
- `ifuri-ecobar.lang` - 0 calls
- `ifuri-ecobar.view` - 0 calls
- `ifuri-ecobar.label` - 0 calls
- `ifuri-ecobar.p` - 0 calls

## System Interactions

How components interact:

```mermaid
graph TD
    main --> read_text
    main --> Bal
    main --> feed
    main --> items
    main --> print
    navHTML --> map
    navHTML --> esc
    navHTML --> isActive
    navHTML --> join
    __init__ --> __init__
    __init__ --> super
    host --> test
    curView --> test
    hostEl --> attachShadow
    sr --> attachShadow
    handle_starttag --> get
    handle_endtag --> get
```

## Reverse Engineering Guidelines

1. **Entry Points**: Start analysis from the entry points listed above
2. **Core Logic**: Focus on classes with many methods
3. **Data Flow**: Follow data transformation functions
4. **Process Flows**: Use the flow diagrams for execution paths
5. **API Surface**: Public API functions reveal the interface

## Context for LLM

Maintain the identified architectural patterns and public API surface when suggesting changes.
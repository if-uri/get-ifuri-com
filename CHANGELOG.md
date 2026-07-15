# Changelog

## [Unreleased] - 2026-07-14

### Fixed
- Fix ast-print-statements issues (ticket-08ad3628)
- Fix ast-missing-return-type issues (ticket-c4bfcd99)
- Fix ruff-print-statements issues (ticket-fbb930d0)
- Fix ruff-sorted-imports issues (ticket-655fda1d)
- Fix smart-return-type issues (ticket-aaee1667)
- Fix string-concat-fstring issues (ticket-22e1db37)
- Fix ai-boilerplate issues (ticket-3503d95b)
- Fix import-optimization issues (ticket-a510713e)

## [Unreleased]

### Changed
- Repurposed get.ifuri.com from the urirun node installer to the **ifURI app**
  download page (desktop builds via GitHub Releases + pip). The node/host
  installers moved to get.urirun.com; `/node.sh` and `/host.sh` 301-redirect
  there. Repo renamed get -> get-ifuri-com.

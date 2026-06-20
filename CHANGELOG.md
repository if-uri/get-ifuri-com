# Changelog

## [Unreleased]

### Added
- Add host-first sections and copyable `host.sh` commands to the public
  `get.ifuri.com` landing page.
- Add a static page contract test for copy targets and required installer URLs.
- Record IFURI-019 follow-up work for install bundles and host/node doctor
  checks.
- Add repository-level TODO for node/host installer follow-up work.
- Link the README to app, docs, examples, connector hub and the current
  cross-repository work summary.

### Changed
- Group `get.ifuri.com` by Host, Node, Windows, LAN flow, application and
  fallback links so the page is not node-only.
- Document `get.ifuri.com` as the bootstrap entry point for `urirun` host and
  node participation in the ifURI mesh ecosystem.
- Point default runtime install URLs at `github.com/if-uri/urirun`.
- Use the sibling `if-uri/urirun` checkout as the default local smoke-test
  fallback instead of the old `tellmesh/urihandler` path.

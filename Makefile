.PHONY: serve test deploy help
PORT ?= 8199
help:
	@grep -E "^[a-zA-Z_-]+:.*?## .*$$" $(MAKEFILE_LIST) | awk "BEGIN{FS=\":.*?## \"}{printf \"  %-10s %s\\n\",\$$1,\$$2}"
serve: ## Serve locally on http://127.0.0.1:$(PORT)
	python3 -m http.server $(PORT)
test: ## Validate the static app-download site
	python3 scripts/check_site.py
deploy: ## Publish to get.ifuri.com (Plesk)
	bash scripts/deploy-plesk.sh

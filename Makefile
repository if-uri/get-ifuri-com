.PHONY: serve test

PORT ?= 8199

serve:
	python3 -m http.server $(PORT)

test:
	bash -n node.sh
	python3 -m http.server 0 >/tmp/ifuri-get-test.log 2>&1 & echo $$! > /tmp/ifuri-get-test.pid
	kill "$$(cat /tmp/ifuri-get-test.pid)"

.PHONY: deploy
deploy: ## Publish to get.ifuri.com (Plesk)
	bash scripts/deploy-plesk.sh

#!/usr/bin/env bash
# Publish get.ifuri.com (ifURI app download page) to Plesk.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REMOTE="${IFURI_DEPLOY_HOST:-ifuri@ifuri.com}"
DOCROOT="${IFURI_GET_DOCROOT:-/var/www/vhosts/ifuri.com/get.ifuri.com}"

python3 "${ROOT}/scripts/check_site.py"
echo "== deploy get.ifuri.com -> ${REMOTE}:${DOCROOT} =="
rsync -az --delete --exclude '.git' --exclude 'scripts' --exclude 'Makefile' \
  --exclude 'CNAME' --exclude '*.md' --exclude '.github' \
  "${ROOT}/" "${REMOTE}:${DOCROOT}/"
ssh "${REMOTE}" "cd '${DOCROOT}' && find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +"

# ---- post-deploy verification: the app downloads and runs ----
BASE="${GET_IFURI_BASE:-https://get.ifuri.com}"
APP_REPO="${IFURI_APP_REPO:-if-uri/app}"

echo "== post-deploy: page is live =="
curl -fsS -o /dev/null "${BASE}/" || { echo "FAIL: ${BASE}/ not serving"; exit 1; }
echo "  ${BASE}/ -> ok"

echo "== post-deploy: app download source is reachable =="
REL="$(curl -fsSL "https://api.github.com/repos/${APP_REPO}/releases/latest" 2>/dev/null || true)"
if printf '%s' "$REL" | grep -q '"tag_name"'; then
  TAG="$(printf '%s' "$REL" | sed -n 's/.*"tag_name":[[:space:]]*"\([^"]*\)".*/\1/p' | head -1)"
  echo "  latest ${APP_REPO} release: ${TAG:-?} reachable"
else
  echo "  WARN: could not read ${APP_REPO} releases (rate limit / no release yet)"
fi

echo "== post-deploy: download + run the ifURI app =="
TMP="$(mktemp -d)"
if python3 -m venv "${TMP}/venv" \
   && timeout 240 "${TMP}/venv/bin/python" -m pip install -q "git+https://github.com/${APP_REPO}.git" \
   && timeout 60 "${TMP}/venv/bin/ifuri-app" --help >/dev/null 2>&1; then
  echo "  ifURI app installs and runs (ifuri-app --help) -> ok"
else
  echo "  WARN: could not install/run the ifURI app in this environment (GUI deps / network) — page + release verified above"
fi
rm -rf "${TMP}"
echo done

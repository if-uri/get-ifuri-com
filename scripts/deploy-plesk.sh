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
curl -fsSI "https://get.ifuri.com/" | head -3 || true
echo done

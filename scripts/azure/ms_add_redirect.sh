#!/usr/bin/env bash
set -euo pipefail
APP_ID="${1:?Usage: $0 <APP_CLIENT_ID> <REDIRECT_URI>}"
REDIRECT_URI="${2:?Usage: $0 <APP_CLIENT_ID> <REDIRECT_URI>}"
az ad app update --id "$APP_ID" --web-redirect-uris "$REDIRECT_URI"
echo "Updated redirect URIs for $APP_ID → $REDIRECT_URI"

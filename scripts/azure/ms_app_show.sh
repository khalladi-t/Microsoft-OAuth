#!/usr/bin/env bash
set -euo pipefail
APP_ID="${1:?Usage: $0 <APP_CLIENT_ID>}"
az ad app show --id "$APP_ID" --only-show-errors --output json

#!/usr/bin/env bash
set -euo pipefail
PORT="${1:-4001}"
if command -v ss >/dev/null; then
  ss -tlnp | grep -E ":$PORT\\b" || { echo "No listener on :$PORT"; exit 1; }
else
  netstat -tlnp | grep -E ":$PORT\\b" || { echo "No listener on :$PORT"; exit 1; }
fi

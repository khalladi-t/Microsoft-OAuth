#!/usr/bin/env bash
set -euo pipefail
TOKEN=$(curl -s -X PUT "http://<hostname/ip>/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://<hostname/ip>/latest/dynamic/instance-identity/document

#!/usr/bin/env bash
set -euo pipefail
TOKEN=$(curl -s -X PUT "http://<host/ip>/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document

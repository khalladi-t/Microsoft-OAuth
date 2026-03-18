#!/usr/bin/env bash
set -euo pipefail
SG_ID="${1:?Usage: $0 <SECURITY_GROUP_ID> [PORT=4001] [CIDR=0.0.0.0/0]}"
PORT="${2:-4001}"
CIDR="${3:-0.0.0.0/0}"

aws ec2 authorize-security-group-ingress \
  --group-id "$SG_ID" \
  --ip-permissions IpProtocol=tcp,FromPort=$PORT,ToPort=$PORT,IpRanges="[{CidrIp=$CIDR}]"

echo "Opened TCP $PORT on SG $SG_ID for $CIDR"

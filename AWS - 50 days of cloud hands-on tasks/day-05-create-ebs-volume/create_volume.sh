#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <availability-zone>"
  exit 1
fi
AZ="$1"
VOLUME_ID=$(aws ec2 create-volume --availability-zone "$AZ" --size 2 --volume-type gp3 \
  --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=devops-volume}]" --query 'VolumeId' --output text)

echo "Created volume: $VOLUME_ID in $AZ"

#!/usr/bin/env bash
set -euo pipefail

# create_eip.sh
# Usage: ./create_eip.sh [name] [instance-id]
# Default name: xfusion-eip

NAME=${1:-xfusion-eip}
INSTANCE_ID=${2:-}

command -v aws >/dev/null 2>&1 || { echo "AWS CLI not found. Install and configure with 'aws configure'."; exit 1; }

# Allocate an EIP (VPC scope)
echo "Allocating Elastic IP (VPC)"
ALLOC_JSON=$(aws ec2 allocate-address --domain vpc --output json)
ALLOCATION_ID=$(echo "$ALLOC_JSON" | python -c "import sys, json; print(json.load(sys.stdin)['AllocationId'])")
PUBLIC_IP=$(echo "$ALLOC_JSON" | python -c "import sys, json; print(json.load(sys.stdin)['PublicIp'])")

echo "AllocationId: $ALLOCATION_ID, PublicIp: $PUBLIC_IP"

# Tag with Name
aws ec2 create-tags --resources "$ALLOCATION_ID" --tags Key=Name,Value="$NAME"
echo "Tagged $ALLOCATION_ID with Name=$NAME"

if [ -n "$INSTANCE_ID" ]; then
  echo "Associating $ALLOCATION_ID with instance $INSTANCE_ID"
  ASSOC_JSON=$(aws ec2 associate-address --instance-id "$INSTANCE_ID" --allocation-id "$ALLOCATION_ID" --output json)
  ASSOCIATION_ID=$(echo "$ASSOC_JSON" | python -c "import sys, json; print(json.load(sys.stdin)['AssociationId'])")
  echo "Associated. AssociationId: $ASSOCIATION_ID"
fi

echo "Done. Use 'aws ec2 describe-addresses --allocation-ids $ALLOCATION_ID -o table' to view."
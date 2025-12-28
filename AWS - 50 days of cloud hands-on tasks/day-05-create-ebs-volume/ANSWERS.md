## CLI solution

Create the gp3 2 GiB volume and tag it `devops-volume`.

```bash
# Create the volume (pick your AZ)
aws ec2 create-volume --availability-zone us-east-1a --size 2 --volume-type gp3 \
  --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=devops-volume}]'

# Example verify (returns volume ID, state, type, size)
aws ec2 describe-volumes --filters "Name=tag:Name,Values=devops-volume" --query "Volumes[*].{ID:VolumeId,State:State,Size:Size,Type:VolumeType,AZ:AvailabilityZone}" --output table
```

## Script
`create_volume.sh` creates a gp3 2 GiB volume in the requested AZ and prints the created VolumeId.

```bash
#!/usr/bin/env bash
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <availability-zone>"
  exit 1
fi
AZ="$1"
aws ec2 create-volume --availability-zone "$AZ" --size 2 --volume-type gp3 \
  --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=devops-volume}]" --output json | jq -r '.VolumeId'
```

Notes:
- Replace `us-east-1a` with the AZ you need.
- Ensure the AWS CLI is configured (region/account) and you have privileges to create volumes.

## Console (Visual walkthrough) 🔍

Follow these steps in the AWS Console (EC2 → Volumes) to create the volume visually:

1. EC2 Console → left menu → **Volumes** → **Create volume**
   - **Volume Type**: gp3
   - **Size (GiB)**: 2
   - **Availability Zone**: choose the AZ you'll use (e.g., `us-east-1a`)
   - Add tag `Name = devops-volume`
   - Click **Create volume**

2. Verify the volume:
   - In Volumes list, filter by tag `Name = devops-volume`
   - Confirm **Type** = gp3 and **Size** = 2 GiB.


Simple diagram:

Volume (gp3, 2 GiB) → Availability Zone (AZ) → Tag: Name=devops-volume

Tip: Use the console for an easy visual validation, and the CLI for repeatable automation.

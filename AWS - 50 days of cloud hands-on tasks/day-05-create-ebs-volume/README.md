# Day 05 — Create an EBS Volume (gp3, 2 GiB)

## Goal
Create a new EBS volume named `devops-volume` of type `gp3` and size `2` GiB.

## Notes
- Volumes are created in a specific Availability Zone (AZ); choose the AZ where you will attach the volume later.
- Ensure AWS CLI is configured for the intended region/account.

## Quick CLI steps
1. Create a volume in a given AZ (example: us-east-1a):

```bash
aws ec2 create-volume --availability-zone us-east-1a --size 2 --volume-type gp3 \
  --tag-specifications 'ResourceType=volume,Tags=[{Key=Name,Value=devops-volume}]'
```

2. Verify the volume:

```bash
aws ec2 describe-volumes --filters "Name=tag:Name,Values=devops-volume" --query "Volumes[*].{ID:VolumeId,State:State,Size:Size,Type:VolumeType,AZ:AvailabilityZone}" --output table
```

## Script (optional)

`create_volume.sh` in this folder is a tiny helper that creates a gp3 2 GiB volume in a provided AZ and tags it.

Usage:

```bash
chmod +x create_volume.sh
./create_volume.sh us-east-1a
```

## Cleanup
- To delete the volume (when not attached):

```bash
aws ec2 delete-volume --volume-id <volume-id>
```

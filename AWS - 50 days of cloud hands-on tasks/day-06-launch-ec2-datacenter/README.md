# Day 06 — Launch EC2 Instance: `datacenter-ec2`

## Goal
Launch a `t2.micro` EC2 instance using an Amazon Linux AMI, create a new RSA key pair `datacenter-kp`, and attach the default security group.

## Notes
- AMI IDs are region-specific. The script included attempts to find the latest Amazon Linux 2 AMI automatically.
- The default security group id differs per VPC; the script uses `--security-group-ids` with the default security group id looked up.

## Quick steps (CLI)

1. Create key pair (example using AWS CLI):

```bash
# Create key pair and save private key
aws ec2 create-key-pair --key-name datacenter-kp --key-type rsa --query 'KeyMaterial' --output text > datacenter-kp.pem
chmod 400 datacenter-kp.pem
```

2. Get the latest Amazon Linux 2 AMI ID (example for the current region):

```bash
AMI_ID=$(aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.*-x86_64-gp2' 'Name=state,Values=available' --query 'Images | sort_by(@,&CreationDate)[-1].ImageId' --output text)
```

3. Get the default security group id for the default VPC (if needed):

```bash
DEFAULT_SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=default --query 'SecurityGroups[0].GroupId' --output text)
```

4. Launch instance:

```bash
aws ec2 run-instances --image-id "$AMI_ID" --instance-type t2.micro --key-name datacenter-kp --security-group-ids "$DEFAULT_SG" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=datacenter-ec2}]' --output json
```

## Script
`create_datacenter_ec2.sh` will create the key pair, find an Amazon Linux 2 AMI, find default SG, and launch the instance.

Usage:

```bash
chmod +x create_datacenter_ec2.sh
./create_datacenter_ec2.sh
```

## Cleanup
- Terminate the instance and optionally delete the key pair with `aws ec2 delete-key-pair --key-name datacenter-kp` (private key file remains unless removed manually).

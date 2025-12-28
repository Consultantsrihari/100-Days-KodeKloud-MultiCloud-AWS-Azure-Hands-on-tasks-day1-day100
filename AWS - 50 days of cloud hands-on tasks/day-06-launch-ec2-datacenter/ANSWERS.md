## CLI solution (step-by-step)

1. Create a key pair and save the private key locally:

```bash
aws ec2 create-key-pair --key-name datacenter-kp --key-type rsa --query 'KeyMaterial' --output text > datacenter-kp.pem
chmod 400 datacenter-kp.pem
```

2. Find the latest Amazon Linux 2 AMI in your region (generic filter):

```bash
AMI_ID=$(aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.*-x86_64-gp2' 'Name=state,Values=available' --query 'Images | sort_by(@,&CreationDate)[-1].ImageId' --output text)
```

3. Get the default security group id for the default VPC:

```bash
DEFAULT_SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=default --query 'SecurityGroups[0].GroupId' --output text)
```

4. Launch the instance named `datacenter-ec2`:

```bash
aws ec2 run-instances --image-id "$AMI_ID" --instance-type t2.micro --key-name datacenter-kp --security-group-ids "$DEFAULT_SG" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=datacenter-ec2}]' --output json
```

5. Verify the instance is running:

```bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=datacenter-ec2" --query 'Reservations[*].Instances[*].{ID:InstanceId,State:State.Name,Type:InstanceType,AMI:ImageId}' --output table
```

## Script: create_datacenter_ec2.sh
This script automates the steps above including AMI lookup and default SG detection.

```bash
#!/usr/bin/env bash
set -euo pipefail
# create key
if ! aws ec2 describe-key-pairs --key-names datacenter-kp >/dev/null 2>&1; then
  aws ec2 create-key-pair --key-name datacenter-kp --key-type rsa --query 'KeyMaterial' --output text > datacenter-kp.pem
  chmod 400 datacenter-kp.pem
  echo "Created key pair and saved datacenter-kp.pem"
else
  echo "Key pair datacenter-kp already exists"
fi
# find latest Amazon Linux 2 AMI
AMI_ID=$(aws ec2 describe-images --owners amazon --filters 'Name=name,Values=amzn2-ami-hvm-2.0.*-x86_64-gp2' 'Name=state,Values=available' --query 'Images | sort_by(@,&CreationDate)[-1].ImageId' --output text)
DEFAULT_SG=$(aws ec2 describe-security-groups --filters Name=group-name,Values=default --query 'SecurityGroups[0].GroupId' --output text)
aws ec2 run-instances --image-id "$AMI_ID" --instance-type t2.micro --key-name datacenter-kp --security-group-ids "$DEFAULT_SG" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=datacenter-ec2}]'

echo "Launched datacenter-ec2 (check console for the instance state)"

## Console (Visual walkthrough) 🖼️

Steps to perform this end-to-end in the AWS Console (EC2):

1. **Create key pair**
   - EC2 Console → left menu → **Key pairs** → **Create key pair**
   - Name: `datacenter-kp`, Type: **RSA**; download the private key

2. **Find Amazon Linux 2 AMI**
   - EC2 Console → **AMIs** (search owner: Amazon) → choose the latest **Amazon Linux 2** AMI

3. **Launch instance**
   - EC2 Console → **Instances** → **Launch instances**
   - Select the chosen AMI → Instance type **t2.micro** → Key pair **datacenter-kp** → Security group: choose **default** (or select existing default SG) → Add tag `Name=datacenter-ec2`

4. **Review & Launch**
   - Review configuration → Launch

5. **Verify instance**
   - EC2 Console → **Instances** list → filter by Name → confirm instance `datacenter-ec2` is `running`, instance type is `t2.micro`, key pair is `datacenter-kp`

Quick flow:
Key pair → Select AMI → Configure instance (t2.micro) → Choose default SG → Tag Name=datacenter-ec2 → Launch

Note: AMI IDs are region-specific; confirm AMI in your target region before launching.
```

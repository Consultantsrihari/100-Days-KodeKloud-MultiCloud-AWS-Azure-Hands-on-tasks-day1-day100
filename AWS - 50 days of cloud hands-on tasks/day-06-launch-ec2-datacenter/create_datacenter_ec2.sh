#!/usr/bin/env bash
set -euo pipefail
# Create key pair if not exists
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

echo "Launched datacenter-ec2"

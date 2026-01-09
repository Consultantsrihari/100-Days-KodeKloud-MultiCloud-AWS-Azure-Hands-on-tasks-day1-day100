# Day 15: Create Volume Snapshot

## 📌 Task Overview
The Nautilus DevOps team is preparing automated backup strategies for important
AWS resources. As part of this process, a snapshot must be created from an
existing EBS volume to ensure data durability and recovery.

## This task demonstrates how to create an EBS snapshot using:
1. AWS Management Console  
2. AWS CLI automation  
3. Terraform (Infrastructure as Code)

---

## 🧩 Problem Statement

- **AWS Region:** us-east-1
- **EBS Volume Name:** xfusion-vol
- **Snapshot Name:** xfusion-vol-ss
- **Snapshot Description:** xfusion Snapshot

### 🎯 Objective
Create a snapshot of the EBS volume `xfusion-vol` with the required name and
description, and ensure the snapshot status is **completed**.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Select region **us-east-1**

### Step 2: Navigate to Volumes
- EC2 Dashboard → Volumes
- Select **xfusion-vol**

### Step 3: Create Snapshot
- Actions → Create snapshot
- Name: **xfusion-vol-ss**
- Description: **xfusion Snapshot**
- Click **Create snapshot**

### Step 4: Verify Status
- EC2 → Snapshots
- Ensure status is **completed**

✅ Console method completed.

---

## 🤖 Method 2: Automation using AWS CLI

### Step 1: Set Region
```bash
aws configure set region us-east-1
```
### Step 2: Get Volume ID
```
aws ec2 describe-volumes \
--filters "Name=tag:Name,Values=xfusion-vol" \
--query "Volumes[].VolumeId" \
--output text
```
### Step 3: Create Snapshot
```
aws ec2 create-snapshot \
--volume-id vol-xxxxxxxxxxxx \
--description "xfusion Snapshot" \
--tag-specifications 'ResourceType=snapshot,Tags=[{Key=Name,Value=xfusion-vol-ss}]'
```
###Step 4: Verify Snapshot Status
```
aws ec2 describe-snapshots \
--filters "Name=tag:Name,Values=xfusion-vol-ss" \
--query "Snapshots[].State"
```

### Expected Output:

completed

✅ CLI method completed.

## 🧱 Method 3: Automation using Terraform (IaC)
📁 Terraform File Structure
```
terraform/
 ├── provider.tf
 ├── data.tf
 └── snapshot.tf
```
provider.tf
```
provider "aws" {
  region = "us-east-1"
}
```
data.tf
```
data "aws_ebs_volume" "xfusion_vol" {
  filter {
    name   = "tag:Name"
    values = ["xfusion-vol"]
  }
}
```
snapshot.tf
```
resource "aws_ebs_snapshot" "xfusion_snapshot" {
  volume_id  = data.aws_ebs_volume.xfusion_vol.id
  description = "xfusion Snapshot"

  tags = {
    Name = "xfusion-vol-ss"
  }
}
```

Terraform Execution Steps
```
terraform init
terraform plan
terraform apply
```

- Type yes when prompted.

### Verify Snapshot

- Go to EC2 → Snapshots
- Confirm snapshot name xfusion-vol-ss
- Status should be completed
- ✅ Terraform method completed.
  
### ✅ Final Verification Checklist
- Snapshot Name: xfusion-vol-ss
- Description: xfusion Snapshot
- State: completed
- Region: us-east-1

### 📘 Key Learnings
- Snapshots are incremental and cost-effective
- Terraform enables repeatable backup automation
- IaC reduces manual errors and improves scalability


# Day 13: Create AMI from EC2 Instance

## 📌 Task Overview
The Nautilus DevOps team is migrating infrastructure to AWS using a phased approach.
This task demonstrates how to create an Amazon Machine Image (AMI) from an existing
EC2 instance using both **AWS Management Console** and **AWS CLI automation**.

---

## 🧩 Problem Statement

- **AWS Region:** us-east-1
- **EC2 Instance Name:** xfusion-ec2
- **AMI Name:** xfusion-ec2-ami

### 🎯 Objective
Create an AMI from the EC2 instance `xfusion-ec2` and ensure the AMI status is
**available**.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Select region **us-east-1**

---

### Step 2: Navigate to EC2 Instances
- Go to **EC2 Dashboard**
- Click **Instances**
- Select **xfusion-ec2**

---

### Step 3: Create Image (AMI)
- Click **Actions → Image and templates → Create image**
- AMI Name: **xfusion-ec2-ami**
- Leave other settings as default
- Click **Create image**

---

### Step 4: Verify AMI Status
- Navigate to **AMIs** under *Images*
- Locate **xfusion-ec2-ami**
- Ensure status is **available**

✅ Console-level task completed successfully.

---

## 🤖 Method 2: Automation using AWS CLI

### Step 1: Set AWS Region
```bash
aws configure set region us-east-1
```
### Step 2: Fetch EC2 Instance ID
```aws ec2 describe-instances \
--filters "Name=tag:Name,Values=xfusion-ec2" \
--query "Reservations[].Instances[].InstanceId" \
--output text
```
### Step 3: Create AMI
```
aws ec2 create-image \
--instance-id i-xxxxxxxxxxxx \
--name "xfusion-ec2-ami" \
--no-reboot
```
### Step 4: Verify AMI Status
```
aws ec2 describe-images \
--owners self \
--filters "Name=name,Values=xfusion-ec2-ami" \
--query "Images[].State"
```
### Expected Output:

available

### ✅ Final Verification

- AMI name is xfusion-ec2-ami
- AMI state is available
- AMI created successfully

### 📘 Key Learnings

- AMIs are templates for EC2 instances
- AMIs enable quick recovery and scaling
- --no-reboot avoids instance downtime

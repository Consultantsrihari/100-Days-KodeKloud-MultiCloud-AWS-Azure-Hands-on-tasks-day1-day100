# Day 12: Attach Volume to EC2 Instance

## 📌 Task Overview
The Nautilus DevOps team is migrating workloads to AWS in a phased manner.
This task demonstrates how to attach an existing EBS volume to an EC2 instance
using both **AWS Management Console** and **AWS CLI automation**.

---

## 🧩 Problem Statement

- **AWS Region:** us-east-1
- **EC2 Instance Name:** devops-ec2
- **EBS Volume Name:** devops-volume
- **Device Name:** /dev/sdb

### 🎯 Objective
Attach the existing EBS volume `devops-volume` to the EC2 instance `devops-ec2`
using device name `/dev/sdb`.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Select region **us-east-1**

---

### Step 2: Navigate to Volumes
- Go to **EC2 Dashboard**
- Click **Volumes** under *Elastic Block Store*

---

### Step 3: Select the Volume
- Select **devops-volume**
- Click **Actions → Attach Volume**

---

### Step 4: Attach Volume to EC2
- Instance: **devops-ec2**
- Device name: **/dev/sdb**
- Click **Attach**

---

### Step 5: Verify Volume State
- Volume state should show **in-use**
- Attached to **devops-ec2**

✅ Console-level task completed successfully.

---

## 🤖 Method 2: Automation using AWS CLI

### Step 1: Set AWS Region
```bash
aws configure set region us-east-1
```
### Step 2: Fetch EC2 Instance ID
```
aws ec2 describe-instances \
--filters "Name=tag:Name,Values=devops-ec2" \
--query "Reservations[].Instances[].InstanceId" \
--output text
```
### Step 3: Fetch Volume ID
```
aws ec2 describe-volumes \
--filters "Name=tag:Name,Values=devops-volume" \
--query "Volumes[].VolumeId" \
--output text
```
### Step 4: Attach Volume to EC2
```
aws ec2 attach-volume \
--volume-id vol-xxxxxxxxxxxx \
--instance-id i-xxxxxxxxxxxx \
--device /dev/sdb
```
### Step 5: Verify Volume Attachment
```
aws ec2 describe-volumes \
--volume-ids vol-xxxxxxxxxxxx \
--query "Volumes[].State"
```
### Expected Output:
in-use

### ✅ Final Verification
- EC2 instance is running
- Volume state is in-use
- Volume attached as /dev/sdb

### 📘 Key Learnings
- EBS volumes provide persistent storage
- Volumes must be in the same AZ as EC2
- Device names matter for OS-level mounting

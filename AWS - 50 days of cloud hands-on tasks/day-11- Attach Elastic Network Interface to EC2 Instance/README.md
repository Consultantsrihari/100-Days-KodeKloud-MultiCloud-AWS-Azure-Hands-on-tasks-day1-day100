# Day 11: Attach Elastic Network Interface to EC2 Instance

## 📌 Task Overview
The Nautilus DevOps team is migrating workloads to AWS by breaking them into smaller tasks.
This task demonstrates how to attach an Elastic Network Interface (ENI) to an EC2 instance
using both **AWS Management Console** and **AWS CLI automation**.

---

## 🧩 Problem Statement

- **AWS Region:** us-east-1
- **EC2 Instance:** xfusion-ec2
- **Elastic Network Interface:** xfusion-eni

### 🎯 Objective
Attach the Elastic Network Interface `xfusion-eni` to the EC2 instance `xfusion-ec2`
and ensure the status is **attached**.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Select region **us-east-1**

---

### Step 2: Navigate to Network Interfaces
- Go to **EC2 Dashboard**
- Click **Network Interfaces** under *Network & Security*

---

### Step 3: Select the ENI
- Select **xfusion-eni**
- Click **Actions → Attach**

---

### Step 4: Attach ENI to EC2
- Instance: **xfusion-ec2**
- Device Index: **1**
- Click **Attach**

---

### Step 5: Verify Status
- Ensure ENI status shows **attached**
- EC2 instance state is **running**

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
--filters "Name=tag:Name,Values=xfusion-ec2" \
--query "Reservations[].Instances[].InstanceId" \
--output text
```
### Step 3: Fetch ENI ID
```
aws ec2 describe-network-interfaces \
--filters "Name=tag:Name,Values=xfusion-eni" \
--query "NetworkInterfaces[].NetworkInterfaceId" \
--output text

```
### Step 4: Attach ENI
```
aws ec2 attach-network-interface \
--network-interface-id eni-xxxxxxxxxxxx \
--instance-id i-xxxxxxxxxxxx \
--device-index 1
```
### Step 5: Verify Attachment
```
aws ec2 describe-network-interfaces \
--network-interface-ids eni-xxxxxxxxxxxx \
--query "NetworkInterfaces[].Status"
```
### Expected Output:
attached

## ✅ Final Verification

- EC2 instance is running
- ENI status is attached
- No errors reported

## 📘 Key Learnings

- Console is ideal for learning & troubleshooting
- Automation ensures repeatability
- ENIs allow advanced network architectures


# 👤 Author

Srihari

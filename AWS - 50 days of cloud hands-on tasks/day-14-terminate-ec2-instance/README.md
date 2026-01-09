# Day 14: Terminate EC2 Instance

## 📌 Task Overview
During the AWS migration process, certain resources become obsolete as new
solutions are implemented. This task demonstrates how to safely terminate an
EC2 instance using both **AWS Management Console** and **AWS CLI automation**.

---

## 🧩 Problem Statement

- **AWS Region:** us-east-1
- **EC2 Instance Name:** nautilus-ec2

### 🎯 Objective
Terminate the EC2 instance `nautilus-ec2` and ensure its final state is
**terminated** before submission.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Select region **us-east-1**

---

### Step 2: Navigate to EC2 Instances
- Go to **EC2 Dashboard**
- Click **Instances**
- Locate **nautilus-ec2**

---

### Step 3: Terminate the Instance
- Select **nautilus-ec2**
- Click **Instance state → Terminate instance**
- Confirm termination

---

### Step 4: Verify Instance State
- Instance state should show **terminated**

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
--filters "Name=tag:Name,Values=nautilus-ec2" \
--query "Reservations[].Instances[].InstanceId" \
--output text
```
###Step 3: Terminate EC2 Instance
```
aws ec2 terminate-instances \
--instance-ids i-xxxxxxxxxxxx
```
### Step 4: Verify Terminated State
```
aws ec2 describe-instances \
--instance-ids i-xxxxxxxxxxxx \
--query "Reservations[].Instances[].State.Name"
```

### Expected Output:

terminated

## ✅ Final Verification
- EC2 instance name: nautilus-ec2
- Instance state: terminated
- Task completed successfully

## 📘 Key Learnings
- Terminated instances cannot be recovered
- EBS volumes may persist if delete-on-termination is disabled
- Always verify before terminating production instances

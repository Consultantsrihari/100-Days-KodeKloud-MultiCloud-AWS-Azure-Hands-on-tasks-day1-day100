# Day 16: Create IAM User

## 📌 Task Overview
Identity and Access Management (IAM) is a foundational AWS service used to manage
users, permissions, and access controls. As part of the infrastructure setup,
the Nautilus DevOps team needs to create an IAM user.

This task demonstrates how to create an IAM user using:
1. AWS Management Console  
2. AWS CLI automation  
3. Terraform (Infrastructure as Code)

---

## 🧩 Problem Statement

- **IAM User Name:** iamuser_rose

### 🎯 Objective
Create an IAM user named **iamuser_rose**.

---

## 🛠️ Method 1: AWS Management Console (Manual)

### Step 1: Login to AWS Console
- Open https://console.aws.amazon.com
- Navigate to **IAM**

---

### Step 2: Navigate to Users
- Click **Users**
- Click **Create user**

---

### Step 3: Create IAM User
- User name: **iamuser_rose**
- Click **Next**
- Skip permissions for now (no policies required)
- Click **Create user**

---

### Step 4: Verify User Creation
- Ensure user **iamuser_rose** appears in the IAM Users list

✅ Console method completed successfully.

---

## 🤖 Method 2: Automation using AWS CLI

### Step 1: Create IAM User
```bash
aws iam create-user --user-name iamuser_rose
```
### Step 2: Verify IAM User
```
aws iam list-users --query "Users[].UserName"
```
### Expected Output:
iamuser_rose

✅ CLI method completed successfully.

# 🧱 Method 3: Automation using Terraform (IaC)
## 📁 Terraform File Structure
```
terraform/
├── provider.tf
└── iam_user.tf
```

provider.tf
```
provider "aws" {
  region = "us-east-1"
}
```
iam_user.tf
```
resource "aws_iam_user" "iam_user_rose" {
  name = "iamuser_rose"
}
```
### Terraform Execution Steps
```
terraform init
terraform plan
terraform apply
```
### Verify IAM User

- Go to IAM → Users
- Confirm user iamuser_rose exists

✅ Terraform method completed successfully.

### ✅ Final Verification Checklist
- IAM user name: iamuser_rose
- User exists in IAM console
- No errors during creation

###📘 Key Learnings
- IAM is global (not region-specific)
- IAM users represent individual identities
- Terraform enables repeatable IAM management
- Principle of least privilege is critical

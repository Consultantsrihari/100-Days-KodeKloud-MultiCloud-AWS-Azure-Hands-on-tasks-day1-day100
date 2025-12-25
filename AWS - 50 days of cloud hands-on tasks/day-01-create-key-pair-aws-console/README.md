# Day 1 — Create Key Pair (AWS Console)

## Goal
Create an EC2 Key Pair using the AWS Management Console (no scripts) and learn how to use it to connect to instances.

## Overview
This exercise is performed entirely in the AWS Console (console.aws.amazon.com). You will:
- Create a new EC2 Key Pair
- Download and secure the private key file
- Use the key to connect to a Linux EC2 instance (SSH) or decrypt the Windows administrator password
- Understand import and delete behaviors

> Note: Key pairs are region-scoped. Make sure you are in the intended AWS region before creating or importing keys.

## Steps (AWS Console)
1. Sign in to the AWS Management Console and choose the target **Region** in the top-right corner.
2. Open **EC2** from the Services list.
3. In the left navigation under **Network & Security**, click **Key pairs**.
4. Click **Create key pair**.
   - Enter a **Key pair name** (e.g., `nautilus-key`).
   - Choose **Key pair type**: RSA or ED25519 (RSA is widely supported).
   - Choose **Private key file format**: `.pem` (OpenSSH) or `.ppk` (for PuTTY).
   - Click **Create key pair**.
5. The private key file will be downloaded automatically. **Download it and store it safely**; this is the only time you can get the private key from AWS.

## Use the key
- Linux/ macOS/Windows OpenSSH:
  - Place the `.pem` file in `~/.ssh/` and secure permissions: `chmod 400 nautilus-key.pem`.
  - SSH example: `ssh -i ~/.ssh/nautilus-key.pem ec2-user@<public-ip>` (user depends on AMI: `ec2-user`, `ubuntu`, etc.)

- Windows + PuTTY:
  - Convert `.pem` to `.ppk` with PuTTYgen, then use PuTTY to connect.

- Windows Server instances:
  - In EC2 Console, select the instance → **Connect** → **Get Windows password** and use the private key to decrypt the administrator password.

## Importing an existing key
- On the **Key pairs** page click **Import key pair**, give it a name and paste your public key (OpenSSH/OpenPGP format). AWS will store the public key only.

## Important notes
- You can only download the private key once during creation. If you lose it, you cannot retrieve it from AWS.
- Deleting a key pair in the console removes the key pair metadata but does NOT remove the public key from EC2 instances that already have it configured.
- For security, avoid sharing private keys and prefer restricting SSH access by source IP when possible.

## Validation
- Launch a test EC2 instance using the created key pair and verify you can SSH into it.
- For Windows instances, verify you can retrieve the Administrator password via the console.

## Cleanup
- Delete the test EC2 instance.
- Optionally delete the key pair from the **Key pairs** console (Actions → Delete key pair).

---

If you want, I can add: screenshots of the console steps, a short quiz (questions and answers are included), or a short checklist for an instructor guide.

## Resources & Links ✅
- YouTube playlist: https://www.youtube.com/@TechCareerHubs
- GitHub (repo, scripts): https://github.com/Consultantsrihari/100-Days-KodeKloud-MultiCloud-AWS-Azure-Hands-on-tasks-day1-day100
- LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- Instagram: https://www.instagram.com/techcareerhubs/?hl=en
- Website: https://techcareerhubs.com/
- Telegram: https://t.me/+aUHeeIHnADJjZmE1
- KodeKloud registration: https://engineer.kodekloud.com/signup?referral=6946cfc4dee212a47f43cdd4
- AWS Console: https://console.aws.amazon.com/
- Azure Portal: https://portal.azure.com/

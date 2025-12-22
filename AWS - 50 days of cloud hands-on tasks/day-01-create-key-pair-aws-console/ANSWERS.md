# Day 1 — Answers: Create Key Pair (AWS Console)

1. Where: In the AWS Console → EC2 → (left nav) **Key pairs** under **Network & Security**.

2. Create key pair steps: Console → EC2 → Key pairs → Create key pair → enter name → choose key type and file format → Create key pair → download the private key file (this is the only download).

3. File formats: `.pem` (OpenSSH/POSIX) and `.ppk` (PuTTY). Choose `.pem` for OpenSSH clients; `.ppk` for PuTTY on Windows (or convert `.pem` to `.ppk`).

4. Secure permissions: `chmod 400 nautilus-key.pem` so only the owner can read the file.

5. SSH to Linux example (for Amazon Linux/Ubuntu, user varies by AMI):
   - `ssh -i ~/.ssh/nautilus-key.pem ec2-user@<public-ip>` or `ssh -i ~/.ssh/nautilus-key.pem ubuntu@<public-ip>`

6. Windows admin password: Select the Windows instance in EC2 Console → Actions → Security → Get Windows Password → Provide the private key to decrypt the Administrator password.

7. If you lose the private key: AWS cannot regenerate it. You lose SSH access to instances that only have that key configured. Recovery options include using a different access method (SSM Session Manager) or replacing the instance's authorized keys via a rescue instance or volume attachment.

8. Import public key: EC2 Console → Key pairs → Import key pair → name and paste your public key contents (OpenSSH format like `ssh-rsa AAAA...`).

9. Deleting a key pair: Deleting the key pair in the console removes the EC2 key-pair record but does NOT remove the public key from instances that already have it in `~/.ssh/authorized_keys`.

10. Best practice: Restrict SSH access to known IP ranges (your office/home IP) or use a bastion/jump host and SSM Session Manager instead of allowing 0.0.0.0/0.

---

If you want, I can add step-by-step screenshots for the console flow or a short instructor checklist — say which you'd prefer.
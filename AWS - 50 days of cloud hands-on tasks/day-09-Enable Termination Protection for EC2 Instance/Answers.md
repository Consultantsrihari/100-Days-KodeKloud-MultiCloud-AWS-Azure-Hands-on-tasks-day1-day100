# Day 09 – Enable Termination Protection for EC2

## Objective

Enable **Termination Protection** for the EC2 instance named **devops-ec2** in the **us-east-1** region.

---

## Method 1: Using AWS Management Console

### Steps

1. Log in to the AWS Management Console.
2. Navigate to the **EC2** service.
3. Ensure the region is set to **us-east-1**.
4. Click **Instances** from the left-hand menu.
5. Select the EC2 instance named **devops-ec2**.
6. Click **Actions** → **Instance settings** → **Change termination protection**.
7. Select **Enable**.
8. Click **Save**.

✅ Termination protection is now enabled, and the instance cannot be terminated accidentally.

---

## Method 2: Automation (AWS CLI)

### Prerequisites

- AWS CLI installed and configured
- IAM permissions to modify EC2 instance attributes

### Command

```bash
aws ec2 modify-instance-attribute \
  --instance-id <INSTANCE_ID> \
  --disable-api-termination \
  --region us-east-1
```
🔹 Replace <INSTANCE_ID> with the instance ID of devops-ec2.

### Verification

```
aws ec2 describe-instance-attribute \
  --instance-id <INSTANCE_ID> \
  --attribute disableApiTermination \
  --region us-east-1
```

If the value is true, termination protection is enabled.

## Method 3: Automation (Terraform)
```
resource "aws_instance" "devops_ec2" {
  instance_id               = "i-xxxxxxxxxxxx"
  disable_api_termination   = true
}
```
Apply the configuration:

terraform apply

## Conclusion

Termination protection is a critical safeguard for production and migration-critical EC2 instances, ensuring they cannot be deleted accidentally via the Console, CLI, or API.

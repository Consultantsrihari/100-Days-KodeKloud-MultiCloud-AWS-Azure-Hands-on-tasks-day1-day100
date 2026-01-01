# Day 08 – Enable Stop Protection for EC2

## Objective

Enable **Stop Protection** for the EC2 instance named **nautilus-ec2** in the **us-east-1** region.

---

## Method 1: Using AWS Management Console

### Steps

1. Log in to the **AWS Management Console**.
2. Navigate to **EC2** service.
3. Make sure the region is set to **us-east-1**.
4. Click on **Instances** from the left navigation pane.
5. Select the EC2 instance named **nautilus-ec2**.
6. Click on **Actions** → **Instance settings** → **Change stop protection**.
7. Check **Enable** to turn on stop protection.
8. Click **Save**.

✅ Stop protection is now enabled, and the instance cannot be stopped accidentally.

---

## Method 2: Automation (AWS CLI)

### Prerequisites

- AWS CLI installed and configured
- Required IAM permissions to modify EC2 attributes

### Command

```bash
aws ec2 modify-instance-attribute \
  --instance-id <INSTANCE_ID> \
  --disable-api-stop false \
  --region us-east-1
```
🔹 Replace <INSTANCE_ID> with the instance ID of nautilus-ec2.
### Verification
aws ec2 describe-instance-attribute \
  --instance-id <INSTANCE_ID> \
  --attribute disableApiStop \
  --region us-east-1
  
If the value is false, stop protection is enabled.

### Method 3: Automation (Terraform)
```
resource "aws_instance" "nautilus_ec2" {
  instance_id = "i-xxxxxxxxxxxx"
  disable_api_stop = true
}
```
🔹 Apply using:
terraform apply

### Consulsion

Stop protection ensures that critical EC2 instances are safeguarded from accidental stops, improving workload stability during migrations and production operations.


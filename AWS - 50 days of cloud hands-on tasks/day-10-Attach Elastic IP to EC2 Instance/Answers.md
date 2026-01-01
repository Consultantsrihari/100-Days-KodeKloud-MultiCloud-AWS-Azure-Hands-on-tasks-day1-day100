# Day 10 – Attach Elastic IP to EC2 Instance

## Objective

Attach the Elastic IP **xfusion-ec2-eip** to the EC2 instance **xfusion-ec2** in the **us-east-1** region.

---

## Method 1: Using AWS Management Console

### Steps

1. Log in to the AWS Management Console.
2. Navigate to **EC2** service.
3. Ensure the region is set to **us-east-1**.
4. In the left navigation pane, click **Elastic IPs**.
5. Select the Elastic IP named **xfusion-ec2-eip**.
6. Click **Actions** → **Associate Elastic IP address**.
7. Choose **Instance** as the resource type.
8. Select the EC2 instance **xfusion-ec2**.
9. Select the private IP address (default if only one).
10. Click **Associate**.

✅ Elastic IP is now successfully attached to the EC2 instance.

---

## Method 2: Automation (AWS CLI)

### Prerequisites

- AWS CLI installed and configured
- IAM permissions for EC2 and Elastic IP operations

### Command

```bash
aws ec2 associate-address \
  --instance-id <INSTANCE_ID> \
  --allocation-id <ALLOCATION_ID> \
  --region us-east-1
```
🔹 Replace:

- <INSTANCE_ID> with the instance ID of xfusion-ec2

- <ALLOCATION_ID> with the allocation ID of xfusion-ec2-eip

## verification 

```bash
aws ec2 describe-addresses \
  --allocation-ids <ALLOCATION_ID> \
  --region us-east-1
```
If the instance ID is shown, the Elastic IP is attached successfully.

## Conclusion

Elastic IPs provide a static public IPv4 address, ensuring consistent access to EC2 instances even after stop/start operations—making them ideal for migration and production workloads.

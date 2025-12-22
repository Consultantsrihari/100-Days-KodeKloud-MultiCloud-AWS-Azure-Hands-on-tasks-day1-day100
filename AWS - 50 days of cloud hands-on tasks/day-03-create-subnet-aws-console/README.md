# Day 3 — Create Subnet (AWS Console)

## Task
Create a subnet in the **default VPC** using the AWS Management Console (console-only).

Recommended defaults for this lab (change if you prefer):
- **Subnet name:** nautilus-subnet
- **VPC:** Default VPC
- **IPv4 CIDR block:** 10.0.1.0/24
- **Availability Zone:** (choose one available in the region)
- **Auto-assign public IPv4 address:** Enable (optional, recommended for testing)

> These steps are intended to be performed in the AWS Console and do not require any CLI or scripts.

## Steps (AWS Console)
1. Sign in to the AWS Management Console and choose the **Region** where you want the subnet.
2. Open **VPC** from the Services list.
3. In the left navigation, click **Subnets**.
4. Click **Create subnet**.
   - **Name tag:** `nautilus-subnet`
   - **VPC:** Select the **default VPC** from the dropdown.
   - **Availability Zone:** Choose an AZ (e.g., `us-east-1a`) or leave as `No preference`.
   - **IPv4 CIDR block:** `10.0.1.0/24` (ensure it doesn't overlap with existing subnets in the VPC).
   - (Optional) **Enable auto-assign public IPv4 address:** check the box if you want instances launched in this subnet to receive a public IP by default.
5. Click **Create subnet**.

## Validation
- In the **Subnets** list, find `nautilus-subnet` and confirm:
  - The **VPC** column shows the default VPC.
  - The **IPv4 CIDR** matches `10.0.1.0/24`.
  - The **Availability Zone** is as selected.
- Launch a small EC2 instance into `nautilus-subnet` to verify network connectivity and public IP assignment (if enabled).

## Cleanup (optional)
- Terminate any test EC2 instances in the subnet.
- Delete the subnet: select `nautilus-subnet` → **Actions** → **Delete subnet** → confirm.

---

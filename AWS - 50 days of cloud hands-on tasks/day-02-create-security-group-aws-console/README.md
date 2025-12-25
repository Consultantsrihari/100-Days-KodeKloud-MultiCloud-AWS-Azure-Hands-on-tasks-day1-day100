# Day 2 — Create Security Group (AWS Console)

## Task
Create a security group under the **default VPC** with the following settings (console-only):

- **Name:** `nautilus-sg`
- **Description:** Security group for Nautilus App Servers
- **Inbound rules:**
  - HTTP — TCP port **80**, Source **0.0.0.0/0**
  - SSH  — TCP port **22**, Source **0.0.0.0/0**

> These steps assume you will perform the actions in the AWS Management Console (https://console.aws.amazon.com) and **do not** require any CLI or scripts.

## Steps (AWS Console)
1. Sign in to the AWS Management Console and select the **Region** where you want the security group.
2. Open **EC2** from the Services menu.
3. In the left navigation, under **Network & Security**, click **Security Groups**.
4. Click **Create security group**.
   - **Security group name:** `nautilus-sg`
   - **Description:** `Security group for Nautilus App Servers`
   - **VPC:** Select the **default VPC** from the dropdown.
5. Under **Inbound rules**, click **Add rule** and add the following two rules:
   - **Type:** HTTP, **Protocol:** TCP, **Port range:** 80, **Source:** 0.0.0.0/0
   - **Type:** SSH, **Protocol:** TCP, **Port range:** 22, **Source:** 0.0.0.0/0
6. Leave **Outbound rules** at their default (allow all) and click **Create security group**.

## Validation
- In the **Security Groups** list, find `nautilus-sg` and confirm the **VPC** column shows the default VPC.
- Select `nautilus-sg` and verify under the **Inbound rules** tab you see both:
  - HTTP | TCP | 80 | 0.0.0.0/0
  - SSH  | TCP | 22 | 0.0.0.0/0

## Cleanup (optional)
- To remove the security group: select `nautilus-sg` in the console, choose **Actions → Delete security groups**, and confirm.

---

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


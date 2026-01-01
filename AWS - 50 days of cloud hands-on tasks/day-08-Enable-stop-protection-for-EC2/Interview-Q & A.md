# EC2 Stop Protection – Top Interview Questions & Answers

## 1. What is Stop Protection in EC2 and why is it used?

**Answer:**  
Stop Protection (also called **Disable API Stop**) is an EC2 feature that prevents an instance from being stopped via the AWS Console, CLI, or API. It is mainly used to protect **critical production instances** from accidental shutdowns that could cause downtime or data loss.

---

## 2. Does enabling Stop Protection prevent EC2 termination?

**Answer:**  
No. Stop Protection **only prevents stopping** an instance. It does **not** prevent termination. To protect an instance from deletion, **Termination Protection (Disable API Termination)** must be enabled separately.

---

## 3. Can you enable Stop Protection on a running EC2 instance?

**Answer:**  
Yes. Stop Protection can be enabled on a **running or stopped** EC2 instance without rebooting or impacting the instance. The change is applied immediately.

---

## 4. How do you enable Stop Protection using AWS CLI?

**Answer:**  
You can enable Stop Protection using the following command:

```bash
aws ec2 modify-instance-attribute \
  --instance-id i-xxxxxxxxxxxx \
  --disable-api-stop false \
  --region us-east-1

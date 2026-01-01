# EC2 Termination Protection – Top Interview Questions & Answers (Day 09)

## 1. What is Termination Protection in EC2?

**Answer:**  
Termination Protection is an EC2 safety feature that prevents an instance from being accidentally terminated using the AWS Console, CLI, or API. It is controlled using the **Disable API Termination** attribute.

---

## 2. Does Termination Protection stop or reboot an EC2 instance?

**Answer:**  
No. Termination Protection **only prevents termination** of the instance. It does not restrict stopping, starting, or rebooting the EC2 instance.

---

## 3. Can an EC2 instance be terminated if termination protection is enabled?

**Answer:**  
No. AWS will block the termination request until termination protection is **explicitly disabled**.

---

## 4. How do you enable Termination Protection using AWS CLI?

**Answer:**  

```bash
aws ec2 modify-instance-attribute \
  --instance-id i-xxxxxxxxxxxx \
  --disable-api-termination \
  --region us-east-1
```
This command enables termination protection for the specified EC2 instance.

## 5. In which scenarios should Termination Protection be enabled?

**Answer:**
Termination Protection should be enabled for:

- Production EC2 instances

- Migration-critical servers

- Long-running applications

- Instances hosting critical data

It serves as a safety mechanism against accidental deletion.

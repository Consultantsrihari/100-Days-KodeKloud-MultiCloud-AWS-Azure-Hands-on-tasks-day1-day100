# Day 16: IAM User – Interview Questions & Answers

---

### Q1: What is AWS IAM?
AWS IAM is a service that enables secure management of users, groups, roles,
and permissions in AWS.

---

### Q2: Is IAM a regional or global service?
IAM is a **global** service and is not limited to a specific region.

---

### Q3: What is an IAM user?
An IAM user represents a person or application that interacts with AWS
resources using credentials.

---

### Q4: What credentials can an IAM user have?
- Console password
- Access key and secret key (for programmatic access)

---

### Q5: Why should root account access be avoided?
The root account has unrestricted access and should be used only for
account-level tasks.

---

### Q6: What is the principle of least privilege?
Granting only the minimum permissions required to perform a task.

---

### Q7: Can IAM users be managed using Terraform?
Yes, Terraform can create, update, and delete IAM users using IaC.

---

### Q8: What is the difference between IAM users and roles?
- Users are long-term identities
- Roles are assumed temporarily by services or users

---

### Q9: Is it mandatory to attach policies when creating an IAM user?
No, policies can be attached later.

---

### Q10: How do you verify an IAM user exists?
By checking the IAM Console or using `aws iam list-users`.

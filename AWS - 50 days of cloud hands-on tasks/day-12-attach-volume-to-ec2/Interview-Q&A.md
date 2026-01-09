# AWS EBS Interview Questions

### Q1: What is an EBS volume?
Elastic Block Store (EBS) provides persistent block storage for EC2.

---

### Q2: Can an EBS volume be attached to multiple EC2 instances?
No, EBS volumes can be attached to only one EC2 instance at a time
(except Multi-Attach supported volumes).

---

### Q3: Why must EC2 and EBS be in the same AZ?
EBS volumes are AZ-specific to ensure low latency and durability.

---

### Q4: What happens if an EC2 instance stops?
The EBS volume remains intact unless deleted manually.

---

### Q5: What is the purpose of device name?
It defines how the OS recognizes the attached disk.

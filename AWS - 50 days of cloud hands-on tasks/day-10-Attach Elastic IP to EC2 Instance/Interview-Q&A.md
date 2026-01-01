# Day 10 – Elastic IP & EC2 (Top 5 Interview Q&A)

## 1. What is an Elastic IP in AWS?

**Answer:**  
An Elastic IP (EIP) is a **static public IPv4 address** designed for dynamic cloud computing, allowing you to remap the address to another instance if needed.

---

## 2. Why use an Elastic IP instead of a public IP?

**Answer:**  
A public IP changes when an EC2 instance is stopped and started, while an Elastic IP remains **static**, ensuring uninterrupted access.

---

## 3. Can an Elastic IP be attached to more than one EC2 instance?

**Answer:**  
No. An Elastic IP can be associated with **only one resource at a time**.

---

## 4. What happens if an Elastic IP is not attached to any resource?

**Answer:**  
AWS will continue charging for an **unused Elastic IP**, which encourages efficient IP usage.

---

## 5. When should Elastic IPs be used?

**Answer:**  
Elastic IPs should be used for:
- Production servers
- Migration workloads
- Bastion hosts
- Applications requiring a fixed public IP

---

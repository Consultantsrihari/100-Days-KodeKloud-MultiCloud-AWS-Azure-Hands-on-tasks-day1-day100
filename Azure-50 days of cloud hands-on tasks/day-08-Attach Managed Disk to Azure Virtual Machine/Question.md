
---

## 📄 `Interview-QA.md` – Day 08 (Top 5)

```md
# Day 08 – Azure VM Data Disk (Top 5 Interview Q&A)

## 1. What is a data disk in Azure?

**Answer:**  
A data disk is a managed disk attached to a VM for application data storage, separate from the OS disk.

---

## 2. Can a managed disk be attached to multiple VMs?

**Answer:**  
No. A managed disk can be attached to **only one VM at a time**, unless using shared disks.

---

## 3. Does attaching a data disk require VM downtime?

**Answer:**  
No. Data disks can be attached to a **running VM** without stopping it.

---

## 4. What must be done after attaching a disk to a VM?

**Answer:**  
The disk must be **initialized, partitioned, formatted, and mounted** inside the operating system.

---

## 5. Why separate OS disks and data disks?

**Answer:**  
Separating disks improves **performance, scalability, backup flexibility, and recovery** during migrations and production operations.

---

# Day 07 – Azure Public IP (Top 5 Interview Q&A)

## 1. What is a Public IP address in Azure?

**Answer:**  
A Public IP address allows Azure resources to communicate with the internet and be reachable from external networks.

---

## 2. What is the difference between Static and Dynamic Public IPs?

**Answer:**  
- **Static** IP remains the same  
- **Dynamic** IP may change on resource restart  

Static IPs are preferred for production workloads.

---

## 3. What are the SKUs available for Azure Public IPs?

**Answer:**  
Azure provides **Basic** and **Standard** SKUs. Standard is recommended for production due to higher availability and security.

---

## 4. Can a Public IP be used without being attached to a resource?

**Answer:**  
Yes, but unused Public IPs may incur charges depending on SKU and region.

---

## 5. When should Azure Public IPs be used?

**Answer:**  
They are used for:
- Internet-facing applications  
- Load balancers  
- Bastion hosts  
- Migration and hybrid connectivity scenarios

---

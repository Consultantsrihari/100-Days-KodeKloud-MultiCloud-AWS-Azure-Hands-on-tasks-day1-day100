# Day 09 – Azure NIC & VM (Top 5 Interview Q&A)

## 1. Can an Azure VM have multiple network interfaces?

**Answer:**  
Yes. Azure VMs can have multiple NICs depending on the VM size and region limits.

---

## 2. Does attaching a NIC require stopping the VM?

**Answer:**  
Yes, if adding a **secondary NIC**, the VM must be stopped (deallocated) before attachment.

---

## 3. Can you detach the primary NIC from a VM?

**Answer:**  
No. The primary NIC cannot be detached from a VM.

---

## 4. How do you verify a NIC is attached to a VM?

**Answer:**  
You can verify it through:
- Azure Portal → VM → Networking  
- Azure CLI using `az vm nic list`

---

## 5. Why attach multiple NICs to a VM?

**Answer:**  
Multiple NICs are used for:
- Network isolation  
- Multi-tier architectures  
- Security and traffic separation  
- Advanced routing scenarios

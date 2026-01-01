# Day 08 – Attach Data Disk to Azure VM

## Objective

Attach the managed disk **nautilus-disk** to the virtual machine **nautilus-vm** in the **East US** region as a data disk.

---

## Method 1: Using Azure Portal

### Steps

1. Log in to the **Azure Portal**.
2. Search for **Virtual machines** and open it.
3. Select the VM **nautilus-vm**.
4. In the left menu, click **Disks**.
5. Under **Data disks**, click **Attach existing disks**.
6. Select the managed disk **nautilus-disk** from the list.
7. Keep the **LUN** value auto-assigned.
8. Click **Save**.
9. Wait until the update completes and the VM shows **Succeeded** status.

✅ The disk is now attached to the VM as a data disk.

---

## Method 2: Automation (Azure CLI)

### Prerequisites

- Azure CLI installed
- Logged in using `az login`
- Correct subscription selected

### Command

```bash
az vm disk attach \
  --resource-group <RESOURCE_GROUP> \
  --vm-name nautilus-vm \
  --name nautilus-disk
```
🔹 Replace <RESOURCE_GROUP> with the VM’s resource group name.

### Verification
```az vm show \
  --resource-group <RESOURCE_GROUP> \
  --name nautilus-vm \
  --query "storageProfile.dataDisks"
```


If nautilus-disk appears in the output, the disk is attached successfully.

### Note (Inside VM)

After attachment, the disk must be initialized, partitioned, and mounted inside the OS before use.

###cConclusion

Attaching managed disks allows Azure VMs to scale storage independently, making it ideal for migration and production workloads.

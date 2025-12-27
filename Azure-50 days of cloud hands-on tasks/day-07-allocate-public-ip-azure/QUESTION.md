Day 7 — Allocate a Public IP address

Task

The Nautilus DevOps team is continuing its migration to Azure. For this task, allocate a Public IP address in the **East US** region and name it `datacenter-pip`.

Acceptance criteria

- A resource group exists (for example `datacenter-rg`) — create it if needed.
- A Public IP resource named `datacenter-pip` exists in `eastus` and is allocated.

Verification

- Use the Portal: open **Public IP addresses** and confirm `datacenter-pip` exists and shows the allocated address.
- Using Azure CLI:

```bash
az network public-ip show -g datacenter-rg -n datacenter-pip --query "{name:name, ip:ipAddress, allocation:publicIpAllocationMethod, sku:sku.name}" -o table
```

Hints

- You may choose **Static** or **Dynamic** allocation; for a reserved IP choose **Static**.
- Example automation commands are included in `ANSWERS.md` and `create_pip.sh`.

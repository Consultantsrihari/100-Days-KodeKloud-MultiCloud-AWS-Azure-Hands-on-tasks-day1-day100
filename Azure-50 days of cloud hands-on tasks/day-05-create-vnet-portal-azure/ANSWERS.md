## Solution (Portal + automation)

Using the Azure Portal (GUI)

1) Sign in to the Azure Portal: https://portal.azure.com
2) Create a Resource Group (if needed):
   - Search **Resource groups** → **+ Create** → select Subscription → **Resource group**: `nautilus-rg` → **Region**: **East US** → Review + Create → **Create**.
3) Create the Virtual Network:
   - Search **Virtual networks** → **+ Create** → select Subscription and Resource group: `nautilus-rg`.
   - Enter **Name**: `nautilus-vnet`, **Region**: **East US**.
   - Under **IP Addresses** add **IPv4 address space**: `192.168.0.0/24`.
   - Review + Create → **Create**.
4) Verify: Open **Virtual networks**, select `nautilus-vnet` and confirm **Address space** = `192.168.0.0/24` and **Region** = **East US**.

Automation (Azure CLI)

1) Create the resource group and VNet (reproduces Portal settings):

```bash
az group create --name nautilus-rg --location eastus
az network vnet create \
  --resource-group nautilus-rg \
  --name nautilus-vnet \
  --address-prefix 192.168.0.0/24 \
  --location eastus
```

2) Verify with:

```bash
az network vnet show -g nautilus-rg -n nautilus-vnet --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
```

3) Cleanup:

```bash
az group delete -n nautilus-rg --yes --no-wait
```

Notes

- The task requires manual creation via the Portal. The CLI commands are included so the same state can be reproduced or used in automation (scripts, CI).

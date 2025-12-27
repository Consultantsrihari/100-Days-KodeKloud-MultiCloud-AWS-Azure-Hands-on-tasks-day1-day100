## Solution (Portal + automation)

Using the Azure Portal (GUI)

1) Sign in to the Azure Portal: https://portal.azure.com
2) Create a Resource Group (if needed):
   - Search **Resource groups** → **+ Create** → set **Resource group**: `datacenter-rg` → **Region**: **East US** → Review + Create → **Create**.
3) Allocate a Public IP:
   - Search **Public IP addresses** → **+ Create**.
   - Select **Subscription** and **Resource group**: `datacenter-rg`.
   - Enter **Name**: `datacenter-pip`.
   - For **SKU** choose `Standard` or `Basic` (Standard recommended for production), and set **Assignment** to **Static** if you want a reserved address.
   - Review + Create → **Create**.
4) Verify: Open **Public IP addresses**, select `datacenter-pip` and confirm it shows an IP address and the expected allocation method.

Automation (Azure CLI)

1) Create RG and Public IP (example uses Static + Standard SKU):

```bash
az group create --name datacenter-rg --location eastus
az network public-ip create \
  --resource-group datacenter-rg \
  --name datacenter-pip \
  --sku Standard \
  --allocation-method Static \
  --location eastus
```

2) Verify with:

```bash
az network public-ip show -g datacenter-rg -n datacenter-pip --query "{name:name, ip:ipAddress, allocation:publicIpAllocationMethod, sku:sku.name}" -o table
```

3) Cleanup:

```bash
az group delete -n datacenter-rg --yes --no-wait
```

Notes

- Use **Static** allocation when the public IP must not change (recommended for DNS, inbound connectivity). Basic allocation is cheaper; Standard is recommended for production workloads and provides zone-resiliency and better SLA.

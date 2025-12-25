Solution (example using Azure CLI)

1) Create a resource group (if you don't have one):

```bash
az group create --name azure-rg --location eastus
```

2) Create the VNet `azure-vnet` with an IPv4 CIDR block (example `10.0.0.0/16`):

```bash
az network vnet create \
  --resource-group azure-rg \
  --name azure-vnet \
  --address-prefix 10.0.0.0/16 \
  --location eastus
```

3) Verify the VNet exists and check its address space:

```bash
az network vnet show -g azure-rg -n azure-vnet --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
```

4) Cleanup when finished (delete RG and all resources):

```bash
az group delete -n azure-rg --yes --no-wait
```

Using the Azure Portal (GUI)

1) Sign in to the Azure Portal at https://portal.azure.com.

2) Create a Resource Group (if needed):
   - Search for **Resource groups** and click **+ Create**.
   - Pick the **Subscription**, enter **Resource group**: `azure-rg`, and set **Region** to **East US**.
   - Review + Create → **Create**.

3) Create the Virtual Network:
   - Search for **Virtual networks** and click **+ Create**.
   - Select **Subscription**, **Resource group**: `azure-rg`.
   - Enter **Name**: `azure-vnet`, **Region**: **East US**.
   - Under **IP Addresses**, add an **IPv4 address space** (for example `10.0.0.0/16`).
   - Review + Create → **Create**.

4) Verify the VNet:
   - Search **Virtual networks**, open **azure-vnet** and check **Overview** for **Address space** and **Region**.

5) Cleanup from the Portal:
   - Open **Resource groups**, select **azure-rg**, then click **Delete resource group** and follow the prompts.

Using the Python SDK (optional)

Install dependencies:

```bash
pip install azure-identity azure-mgmt-resource azure-mgmt-network
```

Run:

```bash
# set subscription ID (alternatively pass --subscription)
export AZURE_SUBSCRIPTION_ID=<your-subscription-id>   # on Windows use setx or set
az login
python create_vnet.py --resource-group azure-rg --location eastus --vnet-name azure-vnet --address-prefix 10.0.0.0/16
```

Notes

- Replace `azure-rg` with your preferred RG name if desired.
- The VNet must be in `eastus` to meet the task requirement.

## Solution (example using Azure CLI)

1) Create a resource group (if you don't have one):

```bash
az group create --name xfusion-rg --location eastus
```

2) Create the VNet `xfusion-vnet` and a subnet `xfusion-subnet` (subnet prefix example `10.0.0.0/24`):

```bash
az network vnet create \
  --resource-group xfusion-rg \
  --name xfusion-vnet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name xfusion-subnet \
  --subnet-prefix 10.0.0.0/24 \
  --location eastus
```

## Using the Azure Portal (GUI)

1) Sign in to the Azure Portal: https://portal.azure.com

2) Create a Resource Group (if needed):
   - Search for **Resource groups** and click **+ Create**.
   - Select the **Subscription**, set **Resource group** name to `xfusion-rg`, and set **Region** to **East US**.
   - Review + Create → **Create**.

3) Create the Virtual Network and Subnet:
   - Search for **Virtual networks** and click **+ Create**.
   - Select the **Subscription** and **Resource group**: `xfusion-rg`.
   - Enter **Name**: `xfusion-vnet` and **Region**: **East US**.
   - Under **IP Addresses**, add an **IPv4 address space**: `10.0.0.0/16`.
   - Under **Subnets**, click **+ Add subnet** and set **Subnet name**: `xfusion-subnet` and **Subnet address range**: `10.0.0.0/24` → Add.
   - Review + Create → **Create**.

4) Verify in the Portal:
   - Open **Virtual networks**, select **xfusion-vnet**, and confirm **Address space** shows `10.0.0.0/16` and the **Subnets** tab contains `xfusion-subnet` with `10.0.0.0/24`.

3) Verify the VNet and subnet:

```bash
az network vnet show -g xfusion-rg -n xfusion-vnet --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
az network vnet subnet show -g xfusion-rg --vnet-name xfusion-vnet -n xfusion-subnet --query "{name:name, addressPrefix:addressPrefix}" -o table
```

4) Cleanup (delete resource group and everything in it):

```bash
az group delete -n xfusion-rg --yes --no-wait
```

---

What is a subnet?

- A **subnet** is a segment of an IP network (a range of IP addresses) that subdivides a larger Virtual Network (VNet). It provides logical separation of resources inside the VNet and defines which IP addresses can be assigned to resources in that segment.

Why create subnets?

- **Isolation & Organization:** Group related resources (web, app, DB) into separate subnets for clearer architecture and access controls.
- **Security:** Apply Network Security Groups (NSGs) and route tables at the subnet level to control traffic.
- **IP Management:** Control IP addressing and avoid overlap when connecting networks (peering or VPN).
- **Scale & Policy:** Some Azure services require placement in specific subnets (e.g., gateways, appliance integrations).

How subnets work (brief):

- A VNet has one or more address spaces (CIDR blocks), e.g., `10.0.0.0/16`.
- Each subnet is a contiguous, non-overlapping CIDR range inside the VNet address space, e.g., `10.0.1.0/24`.
- Resources (VMs, NICs) attached to a subnet get IPs from that subnet's range.
- Subnet-level constructs (NSGs, route tables) control traffic into/out of all resources within the subnet.

Notes

- Ensure the subnet prefix fits inside the VNet address space and does not overlap with other subnets.
- Choose subnet sizing (e.g., /24) based on expected number of hosts and future growth.

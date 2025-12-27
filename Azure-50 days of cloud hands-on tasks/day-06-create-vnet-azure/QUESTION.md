Day 6 — Create a Virtual Network (VNet) and a Subnet

Task

Create a Virtual Network (VNet) named `xfusion-vnet` and a subnet named `xfusion-subnet` inside the VNet in the **East US** region (`eastus`). The VNet IPv4 address range must be `10.0.0.0/16` and the subnet should use a non-overlapping prefix inside that range (for example `10.0.0.0/24`).

Acceptance criteria

- A resource group (for example `xfusion-rg`) exists (you may create it or use an existing RG).
- A VNet named `xfusion-vnet` exists in **East US** (`eastus`) and has the IPv4 address space `10.0.0.0/16`.
- A subnet named `xfusion-subnet` exists within `xfusion-vnet` and has a valid prefix inside `10.0.0.0/16` (suggested: `10.0.0.0/24`).

Verification

- Use these Azure CLI commands to confirm the resources:

```bash
az network vnet show -g <rg> -n xfusion-vnet --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
az network vnet subnet show -g <rg> --vnet-name xfusion-vnet -n xfusion-subnet --query "{name:name, addressPrefix:addressPrefix}" -o table
```

Hints

- Use the Azure CLI (`az`) or the Azure Portal.
- Example CLI commands are provided in `ANSWERS.md` and there's an automation script `create_vnet.sh` included.

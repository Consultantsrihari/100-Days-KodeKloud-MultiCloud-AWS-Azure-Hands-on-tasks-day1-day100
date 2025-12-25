Day 4 — Create a Virtual Network (VNet)

Task

Create a Virtual Network (VNet) named `azure-vnet` in the **East US** region with any IPv4 CIDR block.

Acceptance criteria

- A VNet named `azure-vnet` exists in an Azure Resource Group (you may create `azure-rg` or use another RG).
- VNet is created in `eastus` (East US) and has at least one IPv4 address space (for example `10.0.0.0/16`).

Verification

- Use `az network vnet show -g <rg> -n azure-vnet` or `az network vnet list -o table` to confirm the VNet name, location, and address space.

Hints

- Use the Azure CLI (`az`) or the Portal.
- Example CLI commands are provided in `ANSWERS.md` and `create_vnet.sh`.
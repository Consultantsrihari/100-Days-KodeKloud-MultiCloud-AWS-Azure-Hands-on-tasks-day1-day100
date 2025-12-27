Day 5 — Create a Virtual Network (VNet) via the Azure Portal

Task

The Nautilus DevOps team is planning the migration of a portion of their infrastructure to the Azure cloud. As a first step, create a Virtual Network (VNet) named `nautilus-vnet` in the **East US** region (`eastus`) using the **Azure Portal (portal.azure.com)**. The VNet must use the IPv4 CIDR `192.168.0.0/24`.

Acceptance criteria

- A resource group (for example `nautilus-rg`) exists (create it via the Portal if needed).
- A VNet named `nautilus-vnet` exists in `eastus` and has the IPv4 address space `192.168.0.0/24`.
- The VNet was created through the Azure Portal (manual GUI steps performed).
- Provide automation (Azure CLI or script) that can create the same VNet programmatically.

Verification

- In the Portal: open **Virtual networks**, select `nautilus-vnet` and confirm **Address space** shows `192.168.0.0/24` and **Region** is **East US**.
- Using Azure CLI (automation):

```bash
az network vnet show -g nautilus-rg -n nautilus-vnet --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
```

Hints

- The primary requirement is to create the VNet via the Azure Portal; after that, add an automation script (`create_vnet_portal.sh`) or Azure CLI commands that reproduce the same resource.

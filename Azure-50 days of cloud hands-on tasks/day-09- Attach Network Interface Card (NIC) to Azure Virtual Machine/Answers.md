# Day 09 – Attach Network Interface (NIC) to Azure VM

## Objective

Attach the network interface **datacenter-nic** to the virtual machine **datacenter-vm** in the **West US** region.

---

## Method 1: Using Azure Portal

### Steps

1. Log in to the **Azure Portal**.
2. Search for **Virtual machines** and open it.
3. Select the VM **datacenter-vm**.
4. Ensure the VM status shows **Running** or **Succeeded**.
5. In the left menu, click **Networking**.
6. Click **Attach network interface**.
7. Select **datacenter-nic** from the list.
8. Click **Save**.
9. Wait for the operation to complete successfully.

✅ The NIC status now shows **Attached** to the VM.

---

## Method 2: Automation (Azure CLI)

### Prerequisites

- Azure CLI installed
- Logged in using `az login`
- Correct subscription selected

### Command

```bash
az vm nic add \
  --resource-group <RESOURCE_GROUP> \
  --vm-name datacenter-vm \
  --nics datacenter-nic
```
🔹 Replace <RESOURCE_GROUP> with the VM’s resource group name.

### Verification
```az vm nic list \
  --resource-group <RESOURCE_GROUP> \
  --vm-name datacenter-vm
```

If datacenter-nic appears in the output, the NIC is attached successfully.

## Method 3: Automation (Terraform)

```
resource "azurerm_network_interface" "datacenter_nic" {
  name                = "datacenter-nic"
  location            = "West US"
  resource_group_name = var.resource_group
}

resource "azurerm_virtual_machine_network_interface_attachment" "nic_attach" {
  virtual_machine_id    = azurerm_linux_virtual_machine.datacenter_vm.id
  network_interface_id  = azurerm_network_interface.datacenter_nic.id
}
```

### Apply Configuration
```
terraform init
terraform apply
```

### Notes

- Azure VM must be stopped (deallocated) if it already has a primary NIC and you are adding a secondary NIC.

- A VM can have multiple NICs, depending on its size.

- The primary NIC cannot be detached from a running VM.

### Conclusion

Attaching multiple NICs allows better network segmentation, security control, and traffic management, which is essential for large-scale Azure migrations.


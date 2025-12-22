#!/bin/bash
# Create DevOps-vm using Azure CLI (example)
set -e
# Usage: ./create_vm_cli.sh [resource-group] [vm-name] [location]
RG=${1:-DevOps-rg}
VM_NAME=${2:-DevOps-vm}
LOCATION=${3:-westus}

az vm create \
    --resource-group "$RG" \
    --name "$VM_NAME" \
    --image Ubuntu2204 \
    --size Standard_B2s \
    --location "$LOCATION" \
    --admin-username azureuser \
    --generate-ssh-keys \
    --storage-sku Standard_LRS \
    --os-disk-size-gb 30

echo "VM created: $VM_NAME in resource group $RG (location: $LOCATION)"
az vm show -g "$RG" -n "$VM_NAME" -d --query publicIps -o tsv | xargs -I{} echo "Public IP: {}"


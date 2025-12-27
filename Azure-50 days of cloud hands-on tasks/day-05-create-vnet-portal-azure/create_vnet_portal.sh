#!/usr/bin/env bash
set -euo pipefail

# Usage: ./create_vnet_portal.sh [resource-group] [location]
# Example: ./create_vnet_portal.sh nautilus-rg eastus

RG=${1:-nautilus-rg}
LOCATION=${2:-eastus}
VNET=nautilus-vnet
ADDRESS_PREFIX=192.168.0.0/24

echo "Creating resource group: $RG in $LOCATION"
az group create --name "$RG" --location "$LOCATION"

echo "Creating VNet: $VNET with address prefix $ADDRESS_PREFIX"
az network vnet create \
  --resource-group "$RG" \
  --name "$VNET" \
  --address-prefix "$ADDRESS_PREFIX" \
  --location "$LOCATION"

echo "Done. Verifying resource:"
az network vnet show -g "$RG" -n "$VNET" --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table

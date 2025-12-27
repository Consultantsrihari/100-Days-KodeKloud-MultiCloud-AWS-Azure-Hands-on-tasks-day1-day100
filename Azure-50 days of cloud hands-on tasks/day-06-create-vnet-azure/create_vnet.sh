#!/usr/bin/env bash
set -euo pipefail

# Usage: ./create_vnet.sh [resource-group] [location]
# Example: ./create_vnet.sh xfusion-rg eastus

RG=${1:-xfusion-rg}
LOCATION=${2:-eastus}
VNET=xfusion-vnet
ADDRESS_PREFIX=10.0.0.0/16
SUBNET=xfusion-subnet
SUBNET_PREFIX=10.0.0.0/24

echo "Creating resource group: $RG in $LOCATION"
az group create --name "$RG" --location "$LOCATION"

echo "Creating VNet: $VNET with address prefix $ADDRESS_PREFIX and subnet $SUBNET ($SUBNET_PREFIX)"
az network vnet create \
  --resource-group "$RG" \
  --name "$VNET" \
  --address-prefix "$ADDRESS_PREFIX" \
  --subnet-name "$SUBNET" \
  --subnet-prefix "$SUBNET_PREFIX" \
  --location "$LOCATION"

echo "Done. Verifying resources:"
az network vnet show -g "$RG" -n "$VNET" --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table
az network vnet subnet show -g "$RG" --vnet-name "$VNET" -n "$SUBNET" --query "{name:name, addressPrefix:addressPrefix}" -o table

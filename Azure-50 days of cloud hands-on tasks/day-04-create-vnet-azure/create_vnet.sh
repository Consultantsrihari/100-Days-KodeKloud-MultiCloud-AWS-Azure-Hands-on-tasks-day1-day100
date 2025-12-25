#!/usr/bin/env bash
set -euo pipefail

# create_vnet.sh
# Usage: ./create_vnet.sh [resource-group] [location] [vnet-name] [cidr]
# Defaults: azure-rg eastus azure-vnet 10.0.0.0/16

RG=${1:-azure-rg}
LOCATION=${2:-eastus}
VNET_NAME=${3:-azure-vnet}
ADDRESS_PREFIX=${4:-10.0.0.0/16}

command -v az > /dev/null 2>&1 || { echo "Azure CLI (az) not found. Install it and run 'az login' first."; exit 1; }

echo "Creating resource group: $RG (location: $LOCATION)"
az group create --name "$RG" --location "$LOCATION"

echo "Creating VNet: $VNET_NAME (address prefix: $ADDRESS_PREFIX) in RG: $RG"
az network vnet create \
  --resource-group "$RG" \
  --name "$VNET_NAME" \
  --address-prefix "$ADDRESS_PREFIX" \
  --location "$LOCATION"

echo "VNet created — details:"
az network vnet show -g "$RG" -n "$VNET_NAME" --query "{name:name, location:location, addressSpace:addressSpace.addressPrefixes}" -o table

echo "Done. To remove resources: az group delete -n $RG --yes --no-wait"

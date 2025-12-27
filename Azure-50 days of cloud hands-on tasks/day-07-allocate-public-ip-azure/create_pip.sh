#!/usr/bin/env bash
set -euo pipefail

# Usage: ./create_pip.sh [resource-group] [location]
# Example: ./create_pip.sh datacenter-rg eastus

RG=${1:-datacenter-rg}
LOCATION=${2:-eastus}
PIP_NAME=datacenter-pip
SKU=${3:-Standard}
ALLOCATION=${4:-Static}

echo "Creating resource group: $RG in $LOCATION"
az group create --name "$RG" --location "$LOCATION"

echo "Creating Public IP: $PIP_NAME (SKU=$SKU, allocation=$ALLOCATION)"
az network public-ip create \
  --resource-group "$RG" \
  --name "$PIP_NAME" \
  --sku "$SKU" \
  --allocation-method "$ALLOCATION" \
  --location "$LOCATION"

echo "Done. Verifying resource:"
az network public-ip show -g "$RG" -n "$PIP_NAME" --query "{name:name, ip:ipAddress, allocation:publicIpAllocationMethod, sku:sku.name}" -o table

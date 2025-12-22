#!/bin/bash
# Simple script to generate an RSA SSH key pair
set -e
KEY_PATH="$HOME/.ssh/azure_vm_key"
ssh-keygen -t rsa -b 2048 -f "$KEY_PATH" -N "" -C "azure-day1"
echo "Created keys: $KEY_PATH and ${KEY_PATH}.pub"

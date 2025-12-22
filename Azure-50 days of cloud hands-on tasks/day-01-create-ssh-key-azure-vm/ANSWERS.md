# Day 1 — Answers: Create SSH Key Pair for Azure Virtual Machine

1. Command that generates an SSH key pair (Linux/macOS):
   ssh-keygen -t rsa -b 2048 -f ~/.ssh/azure_vm_key -C "azure-day1"

2. Tell Azure CLI to generate SSH keys automatically:
   az vm create ... --generate-ssh-keys

3. Supply your own public SSH key:
   az vm create ... --ssh-key-value "$(cat ~/.ssh/azure_vm_key.pub)"
   (On PowerShell, read the pub file into a variable and pass it.)

4. Default private key location on Linux/macOS:
   ~/.ssh/id_rsa (or ~/.ssh/id_ed25519 for ED25519 keys)

5. Private key file permission:
   chmod 600 ~/.ssh/azure_vm_key — this restricts access so only you can read/write it.

6. Connect using private key:
   ssh -i ~/.ssh/azure_vm_key azureuser@<public_ip>

7. Remove the Azure resources (resource group deletion):
   az group delete -n day1-rg --yes --no-wait

8. Passphrase:
   A passphrase encrypts the private key; it protects the key if the file is stolen but requires entering the passphrase when using the key (or using an agent).

---

If you'd like, I can add more detailed step-by-step screenshots, or a brief video script for the lab.

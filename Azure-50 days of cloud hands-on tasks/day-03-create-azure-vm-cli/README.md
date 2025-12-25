# Day 3 — Create an Azure Virtual Machine (CLI)

## Goal
Use the Azure CLI to create the **xfusion-vm** VM (same requirements as Day 2) and verify SSH access.

## Requirements recap
- Use an existing resource group
- VM name: `DevOps-vm`
- Region: **West US**
- Image: **Ubuntu 22.04 LTS** (`Ubuntu2204LTS`)
- Size: **Standard_B1s**
- Ensure NSG allows SSH (port 22)
- OS disk: **30 GB**, **Standard HDD** (Standard_LRS)

## Azure CLI steps (Bash)
Run this command from an Azure client host (example uses `DevOps-rg` and `DevOps-vm`):

```bash
az vm create \
  --resource-group xfusion-rg \
  --name DevOps-vm \
  --image Ubuntu2204 \
  --size Standard_B2s \
  --admin-username azureuser \
  --generate-ssh-keys \
  --storage-sku Standard_LRS \
  --os-disk-size-gb 30
```

This will generate SSH keys locally (e.g. `~/.ssh/id_rsa`) if they do not exist and place the public key on the VM.

If the created NIC does not have an NSG allowing SSH, create and attach one:

```bash
az network nsg create -g $RG -n xfusion-nsg -l westus
az network nsg rule create -g $RG --nsg-name xfusion-nsg -n Allow-SSH --priority 1000 --direction Inbound \
  --access Allow --protocol Tcp --destination-port-ranges 22 --source-address-prefixes '*'

NIC_ID=$(az vm show -g $RG -n xfusion-vm --query "networkProfile.networkInterfaces[0].id" -o tsv)
az network nic update --ids $NIC_ID --network-security-group xfusion-nsg
```

## PowerShell (Windows) example
```powershell
$RG = "<your-existing-resource-group>"
$pub = Get-Content <path-to-pubkey> -Raw
az vm create -g $RG -n xfusion-vm -l westus --image Ubuntu2204LTS --size Standard_B1s \
  --admin-username azureuser --ssh-key-values "$pub" --os-disk-size-gb 30 --storage-sku Standard_LRS
```

## Get public IP & connect
```bash
az vm show -d -g $RG -n DevOps-vm --query publicIps -o tsv
ssh -i <path-to-private-key> azureuser@<public_ip>
```

## Cleanup
```bash
az vm delete -g $RG -n xfusion-vm --yes
az network nsg delete -g $RG -n xfusion-nsg
```

---

**Security note:** Avoid allowing SSH from `0.0.0.0/0` in production. Restrict to your IP or use a bastion host.

## Resources & Links ✅
- YouTube playlist: https://www.youtube.com/@TechCareerHubs
- GitHub (repo, scripts): https://github.com/Consultantsrihari/100-Days-KodeKloud-MultiCloud-AWS-Azure-Hands-on-tasks-day1-day100
- LinkedIn: https://www.linkedin.com/in/venkatasrihari/
- Instagram: https://www.instagram.com/techcareerhubs/?hl=en
- Website: https://techcareerhubs.com/
- Telegram: https://t.me/+aUHeeIHnADJjZmE1
- KodeKloud registration: https://engineer.kodekloud.com/signup?referral=6946cfc4dee212a47f43cdd4
- AWS Console: https://console.aws.amazon.com/
- Azure Portal: https://portal.azure.com/


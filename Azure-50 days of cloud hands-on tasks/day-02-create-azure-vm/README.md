# Day 2 — Create an Azure Virtual Machine (xfusion-vm)

## Goal
Create an Azure VM named **DevOps-vm** in **West US** using an existing resource group and verify SSH access.

## Requirements
- Use an **existing resource group** (select it during creation).
- VM name: **DevOps-vm**
- Region: **West US**
- Image: **Ubuntu 22.04 LTS**
- Size: **Standard_B1s**
- Attach a **Network Security Group (NSG)** that allows inbound **SSH (port 22)**
- OS disk: **30 GB**, **Standard HDD** (Standard_LRS)
- Leave other settings as default

## Using portal.azure.com (web UI)
1. Sign in to https://portal.azure.com.
2. Click **Create a resource** → **Compute** → **Virtual machine**.
3. In **Basics**:
   - Select your **Subscription** and choose the **existing Resource group** from the dropdown.
   - Set **Virtual machine name** to `DevOps-vm` and **Region** to **West US**.
   - Choose **Image** → **Ubuntu 22.04 LTS**.
   - Choose **Size** → **Change size** and pick **Standard_B1s**.
   - For **Authentication type**, choose **SSH public key** and either paste your public key or generate one.
4. In **Disks**:
   - Set **OS disk type** to **Standard HDD** and set **Size (GiB)** to **30**.
5. In **Networking**:
   - Choose a virtual network (default is fine).
   - Under **Network security group**, either use the default and ensure it **allows SSH** or create/select an NSG that has an inbound rule for **SSH (port 22)**. If using the portal option **Allow selected ports**, choose **SSH**.
6. Keep other settings default, **Review + create**, then **Create**.

## Azure CLI example
The Azure CLI instructions and helper scripts for creating the VM have been moved to Day 3: `day-03-create-azure-vm-cli/README.md`.

See `../day-03-create-azure-vm-cli/README.md` for the CLI commands, PowerShell examples, and automation scripts.


## Connect to the VM
1. Get the public IP from the VM Overview in the portal or via:
   az vm show -d -g $RG -n xfusion-vm --query publicIps -o tsv
2. SSH from a machine with OpenSSH:
   ssh -i <path-to-private-key> azureuser@<public_ip>

## Validation
- You should be able to SSH into the VM as `azureuser`.
- Verify `lsblk` shows a single OS disk ~30 GiB and `df -h` shows the root filesystem.
- Confirm `/etc/ssh/sshd_config` is default and port 22 is open from your client.

## Cleanup (optional)
- Delete the VM (and optionally its resources) with:
  az vm delete -g $RG -n xfusion-vm --yes
- Optionally remove NSG: az network nsg delete -g $RG -n xfusion-nsg

---

**Security note:** Allowing SSH from everywhere (0.0.0.0/0) is insecure; prefer limiting SSH to your IP or using a jump/bastion host in production.

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

### Azure Docs (recommended)
- Virtual machines (overview): https://learn.microsoft.com/azure/virtual-machines/
- Create a Linux VM with CLI (quickstart): https://learn.microsoft.com/azure/virtual-machines/linux/quick-create-cli
- Network Security Groups (NSG) overview: https://learn.microsoft.com/azure/virtual-network/network-security-groups-overview
- Azure CLI reference: https://learn.microsoft.com/cli/azure/




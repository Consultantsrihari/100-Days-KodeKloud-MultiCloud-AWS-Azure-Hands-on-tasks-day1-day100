# Day 2 — Answers: Create an Azure Virtual Machine

1. VM name: `xfusion-vm`. Region: **West US**.
2. Image: **Ubuntu 22.04 LTS**. Size: **Standard_B1s**.
3. In the portal's **Disks** tab choose **OS disk type** = **Standard HDD** and set **Size (GiB)** = **30**.
4. In **Networking**, ensure the VM's NIC has an NSG attached that contains an inbound rule allowing **TCP port 22** (source can be restricted to your IP for security).
5. Azure CLI example:
   az vm create -g <rg> -n xfusion-vm -l westus --image Ubuntu2204LTS --size Standard_B1s --admin-username azureuser --ssh-key-values "$(cat <pubkey>)" --os-disk-size-gb 30 --storage-sku Standard_LRS
6. Get public IP: az vm show -d -g <rg> -n xfusion-vm --query publicIps -o tsv. Connect: ssh -i <path-to-private-key> azureuser@<public_ip>
7. Cleanup: az vm delete -g <rg> -n xfusion-vm --yes

---

If you want, I can add a PowerShell script or Terraform example to this folder — tell me which you'd prefer. ✨
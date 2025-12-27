# Day 1 — Create SSH Key Pair for Azure Virtual Machine 🔐

## Goal
Use the Azure portal (portal.azure.com) to create a VM with an SSH key pair and connect to it.

## Using portal.azure.com (web UI)
1. Open the Azure portal: https://portal.azure.com and sign in.
2. Click **Create a resource** → **Compute** → **Virtual machine**.
3. In the **Basics** tab:
   - Choose your **Subscription** and **Resource group** (or create a new one).
   - Enter a **Virtual machine name** and select **Region** and **Image** (e.g., Ubuntu LTS).
   - Under **Administrator account**, choose **SSH public key** as the authentication type.
4. Provide or generate SSH keys:
   - To **use an existing key**, paste your public key into the **SSH public key** field (contents of `id_rsa.pub` or similar).
   - To **generate a new key pair**, click **Generate new key pair** (enter a key name). The portal will generate the key pair and prompt you to download the private key file — **save this file securely**.
5. Finish other required settings (size, networking) and click **Review + create** → **Create**.

## Connect to the VM
- After provisioning, open the VM **Overview** and copy the **Public IP address**.
- From a machine with OpenSSH (Linux/macOS or Windows with OpenSSH/WSL):
  ssh -i <path-to-downloaded-private-key> <admin-username>@<public_ip>
- On Windows using PuTTY: convert the downloaded private key to `.ppk` with PuTTYgen, then connect.

## Validation
- Confirm you can SSH into the VM.
- Verify the VM user's `~/.ssh/authorized_keys` contains the public key.

## Clean up using portal.azure.com
- In the portal, go to **Resource groups**, select the resource group you created, and click **Delete resource group** (type the resource group name to confirm).

---

If you'd like, I can also update the `QUESTION.md` and `ANSWERS.md` to match portal-based steps — tell me if you want that change.

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
- Virtual networks overview: https://learn.microsoft.com/azure/virtual-network/virtual-networks-overview
- Create a VM with CLI (quickstart): https://learn.microsoft.com/azure/virtual-machines/linux/quick-create-cli
- SSH keys for Linux VMs: https://learn.microsoft.com/azure/virtual-machines/linux/ssh-keys
- Azure CLI reference: https://learn.microsoft.com/cli/azure/

### Your links
- Add your links here: paste URLs and short descriptions.

*Tell me if you'd like a shortened one-line footer instead.*

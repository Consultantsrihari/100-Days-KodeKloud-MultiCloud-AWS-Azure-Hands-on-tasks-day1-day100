# Day 04 — Create a Virtual Network (VNet) in Azure

This task covers creating a Virtual Network (VNet) named `azure-vnet` in the **East US** region.

Files included:

- `QUESTION.md` — Task description and acceptance criteria
- `ANSWERS.md` — Example solution and verification commands (CLI + Portal)
- `create_vnet.sh` — Script that uses the Azure CLI (`az`) to create the resource group and VNet
- `create_vnet.py` — (optional) Python script using the Azure SDK to create resource group and VNet

Quick usage

```bash
# make the script executable and run (defaults shown)
chmod +x create_vnet.sh
./create_vnet.sh

# Or supply: <resource-group> <location> <vnet-name> <cidr>
./create_vnet.sh azure-rg eastus azure-vnet 10.0.0.0/16
```

Using Python (Azure SDK)

Install dependencies:

```bash
pip install azure-identity azure-mgmt-resource azure-mgmt-network
```

Run:

```bash
# set subscription ID (alternatively pass --subscription)
export AZURE_SUBSCRIPTION_ID=<your-subscription-id>
az login
python create_vnet.py --resource-group azure-rg --location eastus --vnet-name azure-vnet --address-prefix 10.0.0.0/16
```

Notes

- The script requires the Azure CLI to be installed and authenticated (run `az login` before using) or authenticate using an Azure credential method supported by the SDK.
- The script creates a resource group (default: `azure-rg`) and the VNet `azure-vnet` by default in the `eastus` location.
- Tidy up resources when finished: `az group delete -n azure-rg --yes --no-wait`

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

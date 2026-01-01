# Day 07 – Allocate Public IP Address in Azure

## Objective

Allocate a Public IP address named **datacenter-pip** in Azure.

---

## Method 1: Using Azure Portal

### Steps

1. Log in to the **Azure Portal**.
2. In the search bar, type **Public IP addresses** and open it.
3. Click **Create**.
4. Select the appropriate **Subscription** and **Resource Group**.
5. Enter **datacenter-pip** as the **Name**.
6. Set **IP Version** to **IPv4**.
7. Set **IP Assignment** to **Static**.
8. Choose **Standard** SKU.
9. Select the required **Region**.
10. Click **Review + Create**, then **Create**.

✅ The Public IP address **datacenter-pip** is successfully allocated.

---

## Method 2: Automation (Azure CLI)

### Prerequisites

- Azure CLI installed
- Logged in using `az login`

### Command

```bash
az network public-ip create \
  --resource-group <RESOURCE_GROUP> \
  --name datacenter-pip \
  --sku Standard \
  --allocation-method Static
```
🔹 Replace <RESOURCE_GROUP> with your Azure resource group name.

### Verification

```
az network public-ip show \
  --resource-group <RESOURCE_GROUP> \
  --name datacenter-pip
```
If the Public IP details are displayed, the allocation is successful.

## Conclusion

Public IP addresses in Azure provide external connectivity for cloud resources and are commonly used for production workloads, migration tasks, and internet-facing services.

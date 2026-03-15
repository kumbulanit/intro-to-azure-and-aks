# Lesson 2: Resource Groups and Services with Portal, Cloud Shell, and Azure CLI

## Learning goals
By the end of this lesson, you will:
- Understand what resource groups are and why they matter.
- Create and manage resources using Portal, Cloud Shell, and Azure CLI.
- Apply beginner-friendly operational best practices.

---

## Core concepts in simple language
- **Resource group**: A logical folder for related Azure resources.
- **Azure service**: A cloud capability (VMs, storage, databases, app hosting, etc.).
- **Region**: The physical location where resources run.

Think of a resource group as a project folder that helps with:
- Access control (RBAC)
- Cost tracking
- Lifecycle management (create/update/delete as a unit)

---

## Method 1: Azure Portal (click-based)

### Create a resource group
1. Open [https://portal.azure.com](https://portal.azure.com).
2. Go to **Resource groups** → **Create**.
3. Select your subscription.
4. Enter resource group name: `rg-azure-lab-dev`.
5. Choose region: `East US`.
6. Add tags (example):
   - `Environment=Dev`
   - `Owner=<your-name>`
   - `Project=AzureLearning`
7. Click **Review + Create** → **Create**.

### Create a sample resource (Storage account)
1. Open **Storage accounts** → **Create**.
2. Choose subscription + `rg-azure-lab-dev`.
3. Use a globally unique name, e.g. `stazurelab12345`.
4. Keep defaults for beginner lab use, then create.

---

## Method 2: Azure Cloud Shell (browser terminal)

Open Cloud Shell in the Azure Portal and run:

```bash
RESOURCE_GROUP="rg-azure-lab-dev"
LOCATION="eastus"
STORAGE_NAME="stazurelab$RANDOM"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --tags Environment=Dev Project=AzureLearning

az storage account create \
  --name "$STORAGE_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2
```

---

## Method 3: Azure CLI (local terminal)

```bash
az login
RESOURCE_GROUP="rg-azure-lab-dev"
LOCATION="eastus"
STORAGE_NAME="stazurelab$RANDOM"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --tags Environment=Dev Project=AzureLearning

az storage account create \
  --name "$STORAGE_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2

az resource list --resource-group "$RESOURCE_GROUP" --output table
```

---

## Best practices
- Use one resource group per project/environment (`dev`, `test`, `prod`).
- Tag all resources for cost reporting.
- Keep regions consistent unless you have a multi-region requirement.
- Grant minimum RBAC permissions needed.
- Delete lab resources when finished.

---

## Cleanup
```bash
az group delete --name "rg-azure-lab-dev" --yes --no-wait
```

---

## Quick validation checklist
- [ ] I created one resource group using at least one method.
- [ ] I created one Azure resource inside that group.
- [ ] I listed resources with CLI.
- [ ] I understand how to delete the resource group.

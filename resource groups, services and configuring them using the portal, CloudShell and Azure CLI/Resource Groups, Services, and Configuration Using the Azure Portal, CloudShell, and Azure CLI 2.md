# Lesson 2 (Practice Version): End-to-End Walkthrough

Use this as a guided classroom/lab run after completing Lesson 2.

## Scenario
You are setting up a small dev environment for a demo app. You need:
1. A resource group.
2. A storage account.
3. A blob container.

You will do this with Portal and CLI approaches.

---

## Part A: Portal walkthrough

### 1) Create resource group
- Go to **Resource groups** → **Create**.
- Name: `rg-demo-dev`
- Region: `East US`
- Tags: `Environment=Dev`, `Owner=<your-name>`, `Project=DemoApp`

### 2) Create storage account
- Go to **Storage accounts** → **Create**.
- Resource group: `rg-demo-dev`
- Name: `stdemolab<unique>`
- Region: `East US`
- Performance: Standard
- Redundancy: LRS

### 3) Create container
- Open the storage account.
- Go to **Data storage** → **Containers** → **+ Container**.
- Name: `uploads`
- Public access level: `Private (no anonymous access)`

---

## Part B: CLI walkthrough (same scenario)

```bash
RESOURCE_GROUP="rg-demo-dev"
LOCATION="eastus"
STORAGE_ACCOUNT="stdemolab$RANDOM"
CONTAINER_NAME="uploads"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --tags Environment=Dev Project=DemoApp

az storage account create \
  --name "$STORAGE_ACCOUNT" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2

ACCOUNT_KEY=$(az storage account keys list \
  --resource-group "$RESOURCE_GROUP" \
  --account-name "$STORAGE_ACCOUNT" \
  --query "[0].value" -o tsv)

az storage container create \
  --name "$CONTAINER_NAME" \
  --account-name "$STORAGE_ACCOUNT" \
  --account-key "$ACCOUNT_KEY"
```

> Lab note: this example uses an account key so it works even before blob data roles are assigned. In real projects, prefer Microsoft Entra auth (`--auth-mode login`) or managed identities instead of long-lived account keys.

---

## What students should observe
- Both Portal and CLI produce the same cloud resources.
- CLI is faster for repeatable setups.
- Resource groups and tags make resource management easier.

---

## Common troubleshooting
- **Name not available**: storage account names must be globally unique.
- **Permission denied**: verify subscription and RBAC role.
- **Wrong subscription**: run `az account show` and `az account set`.

---

## Cleanup
```bash
az group delete --name "rg-demo-dev" --yes --no-wait
```

---

## Stretch activity (optional)
- Create a second resource group named `rg-demo-test`.
- Repeat the deployment with tags `Environment=Test`.
- Compare resources and cost grouping in the portal.

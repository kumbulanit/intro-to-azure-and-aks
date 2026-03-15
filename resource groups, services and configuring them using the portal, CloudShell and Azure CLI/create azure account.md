# Lesson 1: Create an Azure Account and Set Up Azure CLI

## Learning goals
By the end of this lesson, you will be able to:
- Create an Azure account safely.
- Sign in to the Azure Portal.
- Install Azure CLI on Windows, macOS, or Linux.
- Sign in with Azure CLI and select the right subscription.

---

## Prerequisites
- A personal Microsoft account (or work/school account).
- A phone number for identity verification.
- A payment card (required by Azure for free trial verification).

> **Cost note:** Free trial subscriptions can still incur charges if you create paid resources. Always monitor your costs.

---

## Step 1: Create your Azure account
1. Go to [https://azure.microsoft.com/free](https://azure.microsoft.com/free).
2. Click **Start free**.
3. Sign in with your Microsoft account (or create one).
4. Complete identity verification.
5. Add billing details and finish signup.
6. After signup, open [https://portal.azure.com](https://portal.azure.com).

---

## Step 2: Get comfortable with the Azure Portal
Inside the portal, find these areas:
- **Home**: quick actions and recently used services.
- **Resource groups**: where you organize resources.
- **Subscriptions**: billing boundary for your resources.
- **Cost Management + Billing**: budget and cost tracking.

---

## Step 3: Install Azure CLI

### Windows
```powershell
winget install -e --id Microsoft.AzureCLI
az version
```

### macOS
```bash
brew update
brew install azure-cli
az version
```

### Ubuntu/Debian Linux
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az version
```

Official install docs: [Azure CLI installation](https://learn.microsoft.com/cli/azure/install-azure-cli).

---

## Step 4: Sign in from CLI and pick subscription
```bash
az login
az account list --output table
az account set --subscription "<SUBSCRIPTION_NAME_OR_ID>"
az account show --output table
```

If you have only one subscription, `az login` may be enough.

---

## Step 5: Configure safe defaults (recommended)
```bash
az configure --defaults location=eastus
```

After you create your first resource group in Lesson 2, you can optionally set a default group:

```bash
az configure --defaults group=rg-azure-lab-dev
```

You can override defaults anytime by passing `--location` or `--resource-group`.

---

## Best practices for beginners
- Enable **MFA** on your Microsoft account.
- Use one sandbox resource group for labs.
- Set a budget in **Cost Management** before building resources.
- Never store secrets/passwords in plain text files.

---

## Quick validation checklist
- [ ] I can sign in to Azure Portal.
- [ ] `az version` works on my machine.
- [ ] `az login` succeeds.
- [ ] `az account show` displays my selected subscription.

---

## Cleanup reminder
At the end of your practice sessions, delete unused resource groups to avoid unexpected charges.

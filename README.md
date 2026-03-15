# Intro to Azure and AKS (Beginner-Friendly)

Welcome! This repository is a practical, layman-friendly learning path for understanding **Microsoft Azure fundamentals** and building the Azure skills you need before starting **Azure Kubernetes Service (AKS)**.

> Scope note: the current lessons focus on Azure foundations, resource management, virtual machines, and App Service. A hands-on AKS lesson is not included yet.

If cloud feels overwhelming, this guide is designed for you: clear language, step-by-step flow, and practical best practices that help you avoid common beginner mistakes.

---

## Who this is for

This repo is ideal for:
- Students and beginners new to cloud computing.
- Developers moving from local apps to cloud-hosted apps.
- Anyone who wants to understand Azure using both GUI and CLI approaches.

No advanced cloud background is required.

---

## What you will learn

By following the lessons in this repository, you will learn how to:
- Create and access an Azure account.
- Understand and create Azure **Resource Groups**.
- Provision and manage Azure resources using:
  - **Azure Portal** (click-based)
  - **Azure Cloud Shell** (browser terminal)
  - **Azure CLI** (local terminal)
- Create and configure **Windows and Linux virtual machines**.
- Understand practical deployment approaches for **Azure App Service** (WordPress and ASP.NET examples).
- Build the Azure foundation you need before moving into AKS topics.
- Apply real-world best practices for security, cost, and operations.

---

## Learning path (recommended order)

Follow these lessons in order:

1. **Create Azure account + install Azure CLI**
   `resource groups, services and configuring them using the portal, CloudShell and Azure CLI/create azure account.md`

2. **Learn resource groups and resource management basics**
   `resource groups, services and configuring them using the portal, CloudShell and Azure CLI/Resource Groups, Services, and Configuration Using the Azure Portal, CloudShell, and Azure CLI.md`

3. **Practice a second, presentation-style walkthrough**
   `resource groups, services and configuring them using the portal, CloudShell and Azure CLI/Resource Groups, Services, and Configuration Using the Azure Portal, CloudShell, and Azure CLI 2.md`

4. **Create and configure virtual machines (Windows + Linux)**
   `resource groups, services and configuring them using the portal, CloudShell and Azure CLI/creating and configuring virtual machines.md`

5. **Learn App Service implementation examples (WordPress + ASP.NET)**
   `resource groups, services and configuring them using the portal, CloudShell and Azure CLI/example implementation to appservice.md`

---


## Participant preflight check (run before labs)

Use this repository script to validate shell snippets and local Azure CLI readiness:

```bash
./scripts/validate-snippets.sh
```

What it checks:
- Bash syntax of all `bash` code blocks in lessons.
- Whether `az` CLI is installed locally.
- Whether you are signed in (`az account show`).

> If `az` is missing, use Cloud Shell in the Azure Portal or install Azure CLI locally before continuing.

---

## Beginner cheat sheet (simple explanations)

- **Azure Subscription**: Your billing/account boundary in Azure.
- **Resource Group**: A folder-like container for related Azure resources.
- **Region**: Physical Azure data center location (e.g., `eastus`).
- **Azure Portal**: Web UI for Azure.
- **Cloud Shell**: Built-in terminal in Azure Portal.
- **Azure CLI (`az`)**: Command-line tool for automation and scripting.
- **VM (Virtual Machine)**: A cloud computer you can run Windows/Linux on.
- **App Service**: Managed hosting for web apps and APIs.
- **AKS**: Managed Kubernetes service for container orchestration.

---

## Best practices (important)

These are the most important habits to build early.

### 1) Naming and organization
- Use consistent names: `project-env-resource-region` (example: `shop-dev-rg-eastus`).
- Keep one project/environment per resource group where possible.
- Use tags on every resource (`Owner`, `Environment`, `CostCenter`, `Project`).

### 2) Security first
- Prefer **SSH keys** over passwords for Linux VMs.
- Never commit secrets (passwords, keys, connection strings) to git.
- Use least-privilege RBAC roles (don’t give Owner rights to everyone).
- Enable HTTPS/TLS for web apps and custom domains.

### 3) Cost control (very important for beginners)
- Start with free tier / low-cost SKUs for labs.
- Stop or deallocate VMs when not in use.
- Create budgets and cost alerts in Azure Cost Management.
- Delete unused resource groups after practice to avoid surprise charges.

### 4) Reliability and operations
- Use one environment at a time first (`dev`), then add `test`/`prod` later.
- Use monitoring from day one (Azure Monitor, Application Insights where relevant).
- Back up databases and critical data.
- Test deployment changes in staging before production.

### 5) Infrastructure as Code mindset
- After manual learning, begin moving to automation:
  - Bicep / ARM templates / Terraform
  - scripted Azure CLI workflows
- Keep configuration versioned in source control.

---

## Suggested hands-on mini labs

To make lessons “stick,” try these small labs:

1. Create one resource group in `eastus` and tag it.
2. Create a Linux VM with SSH key auth and connect once.
3. Deploy a simple App Service and enable HTTPS.
4. Set a budget alert for your subscription.
5. Delete the resource group and confirm cleanup.

---

## Common beginner mistakes to avoid

- Creating resources in random regions without planning.
- Using broad admin permissions for everyone.
- Leaving VMs/databases running overnight.
- Skipping tags (later causes cost confusion).
- Testing directly in production resources.

---

## How this repository can be improved next

Recommended next enhancements:
- Add a dedicated **AKS 101** lesson (cluster, node pools, kubectl basics).
- Add architecture diagrams for each lesson.
- Add short quizzes/checklists at the end of each module.
- Add IaC examples (Bicep/Terraform) matching each manual lesson.
- Add a cleanup script to remove lab resources safely.

---

## Final note

This repository already contains strong practical Azure material. The best way to master it is:
1. Read each lesson.
2. Recreate steps yourself.
3. Apply the best practices above every time.

Cloud skills grow through repetition. Keep labs small, safe, and consistent.

# Lesson 4: Azure App Service Implementations (WordPress and ASP.NET)

## Learning goals
By the end of this lesson, you will:
- Understand App Service fundamentals.
- Deploy a WordPress-style CMS workload.
- Deploy an ASP.NET app.
- Apply production-minded best practices (security, scaling, monitoring).

---

## What is Azure App Service?
Azure App Service is a managed platform for web apps and APIs. Azure handles underlying OS patching, scaling options, and platform operations so you can focus on app code and configuration.

---

## Option A: WordPress-style deployment pattern

> Note: Azure Marketplace offerings can change over time. Always follow the latest portal prompts.

### Recommended architecture
- App Service Plan
- Web App
- Managed database (Azure Database for MySQL - Flexible Server)
- Optional: Azure Cache for Redis, CDN, custom domain + TLS

### High-level steps
1. Create resource group: `rg-web-dev`.
2. Create App Service Plan (Linux, Basic/Standard for labs).
3. Create MySQL Flexible Server.
4. Deploy WordPress app (Marketplace/template workflow).
5. Configure DB connection settings in app configuration.
6. Enable HTTPS-only and custom domain if needed.

### Key best practices
- Use private networking where possible for database access.
- Store secrets in Azure Key Vault (or App Settings with restricted access).
- Enable automatic backups and test restore.
- Keep WordPress/plugins/themes updated.

---

## Option B: ASP.NET deployment pattern

### Beginner-friendly flow
1. Create or open an ASP.NET app locally.
2. Build it locally first so you know the app is in a healthy state before you deploy it.
3. From the app folder, use `az webapp up` to create the App Service resources and deploy in one step.
4. Put app settings and connection strings in App Service configuration, not in source control.
5. Enable Application Insights for monitoring.

If you already have an ASP.NET app, skip the `dotnet new` step and run the deployment command from your existing project folder.

### Example beginner deployment with Azure CLI
```bash
RESOURCE_GROUP="rg-dotnet-dev"
LOCATION="eastus"
WEBAPP_NAME="dotnetapp$RANDOM"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

dotnet new webapp -n BeginnerWebApp
cd BeginnerWebApp
dotnet build

az webapp up \
  --sku F1 \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WEBAPP_NAME" \
  --location "$LOCATION" \
  --os-type Linux
```

`az webapp up` is beginner-friendly because it creates the App Service resources and deploys the app in one workflow. When the command finishes, open the URL it prints to confirm the site is live.

If you want to test locally before deploying, run `dotnet run`, open the local URL, then stop the app and continue with `az webapp up`.

---

## Shared best practices for App Service

### Security
- Enforce HTTPS-only.
- Use managed identity for Azure service access.
- Restrict SCM/Kudu access and deployment credentials.

### Reliability
- Use deployment slots (staging → production swap).
- Turn on health checks.
- Configure backup schedules and retention.

### Performance and scale
- Start with small SKU, monitor, then scale up/out.
- Use autoscale rules for predictable traffic patterns.
- Add caching and CDN for static content heavy apps.

### Observability
- Enable Application Insights.
- Create alerts for 5xx rate, response time, and CPU/memory.
- Review logs regularly after deployments.

---

## WordPress vs ASP.NET (quick comparison)
- **WordPress**: Fast to launch content sites; plugin ecosystem; ongoing maintenance needed.
- **ASP.NET**: Better for custom business logic and APIs; stronger control over architecture.

---

## Cleanup
```bash
az group delete --name "rg-web-dev" --yes --no-wait
az group delete --name "rg-dotnet-dev" --yes --no-wait
```

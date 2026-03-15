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

### From Visual Studio / CLI pipeline
1. Build and test application locally.
2. Create App Service Plan + Web App (Windows or Linux based on runtime).
3. Publish app using Visual Studio, GitHub Actions, or Azure DevOps.
4. Set environment variables/connection strings in App Service configuration.
5. Enable Application Insights for monitoring.

### Example CLI app creation
```bash
RESOURCE_GROUP="rg-dotnet-dev"
LOCATION="eastus"
PLAN_NAME="asp-dotnet-dev-plan"
WEBAPP_NAME="dotnetapp$RANDOM"

az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --sku B1 \
  --is-linux

az webapp create \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --name "$WEBAPP_NAME" \
  --runtime "DOTNETCORE:8.0"
```

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

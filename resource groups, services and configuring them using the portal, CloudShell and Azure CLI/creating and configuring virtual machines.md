# Lesson 3: Creating and Configuring Azure Virtual Machines

## Learning goals
By the end of this lesson, you can:
- Create Windows and Linux VMs in Azure.
- Open only required network ports.
- Connect securely (RDP for Windows, SSH for Linux).
- Apply VM best practices for security and cost.

---

## Prerequisites
- Azure account and selected subscription.
- Existing resource group or permission to create one.
- Azure CLI installed (or Cloud Shell access).

---

## Variables (reuse for both examples)
```bash
RESOURCE_GROUP="rg-vm-lab-dev"
LOCATION="eastus"
ADMIN_USERNAME="azureuser"
```

Create resource group:
```bash
az group create --name "$RESOURCE_GROUP" --location "$LOCATION" --tags Environment=Dev Project=VMLab
```

---

## Part A: Linux VM (recommended first)

### Create Linux VM
```bash
LINUX_VM_NAME="vm-linux-dev"

az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$LINUX_VM_NAME" \
  --image Ubuntu2204 \
  --admin-username "$ADMIN_USERNAME" \
  --generate-ssh-keys \
  --size Standard_B1s
```

### Open SSH port (22)
```bash
az vm open-port --resource-group "$RESOURCE_GROUP" --name "$LINUX_VM_NAME" --port 22
```

### Connect via SSH
```bash
PUBLIC_IP=$(az vm show -d --resource-group "$RESOURCE_GROUP" --name "$LINUX_VM_NAME" --query publicIps -o tsv)
ssh "$ADMIN_USERNAME@$PUBLIC_IP"
```

---

## Part B: Windows Server VM

### Create Windows VM
```bash
WINDOWS_VM_NAME="vm-win-dev"

az vm create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$WINDOWS_VM_NAME" \
  --image Win2022Datacenter \
  --admin-username "$ADMIN_USERNAME" \
  --admin-password "<Choose-A-Strong-Password>" \
  --size Standard_B2s
```

### Open RDP port (3389)
```bash
az vm open-port --resource-group "$RESOURCE_GROUP" --name "$WINDOWS_VM_NAME" --port 3389
```

### Get public IP for RDP
```bash
az vm show -d --resource-group "$RESOURCE_GROUP" --name "$WINDOWS_VM_NAME" --query publicIps -o tsv
```
Then connect with Remote Desktop.

---

## Portal equivalent (quick steps)
1. Go to **Virtual machines** → **Create**.
2. Select subscription, resource group, VM name, region, image, size.
3. Set admin auth (SSH for Linux; strong password for Windows).
4. Allow only required inbound ports.
5. Review and create.

---

## VM best practices
- Prefer SSH keys for Linux; avoid password auth where possible.
- Restrict inbound ports by source IP in NSG rules.
- Use small VM sizes for labs.
- Stop/deallocate VMs when not in use to reduce cost.
- Use Azure Backup or snapshots for important data.

---

## Cost-saving commands
```bash
# Stop and deallocate VM
az vm deallocate --resource-group "$RESOURCE_GROUP" --name "$LINUX_VM_NAME"

# Start VM again
az vm start --resource-group "$RESOURCE_GROUP" --name "$LINUX_VM_NAME"
```

---

## Cleanup
```bash
az group delete --name "$RESOURCE_GROUP" --yes --no-wait
```

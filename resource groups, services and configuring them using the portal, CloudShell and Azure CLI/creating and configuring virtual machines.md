Here's an updated version of the instructions with clear steps for setting variables:

### **Creating and Configuring Virtual Machines on Azure**

## **1. Creating a Windows Server VM**

### **Using Azure Portal:**

(Follow the steps as provided earlier in the **Using Azure Portal** section.)

---

### **Using Azure CloudShell:**

1. **Open CloudShell:**
   - In the Azure Portal, click on the **CloudShell** icon at the top right.

2. **Set Variables for VM Creation:**
   - Before creating the VM, set up variables in CloudShell for easy reference:
     ```bash
     RESOURCE_GROUP="myResourceGroup"          # Name of the resource group
     VM_NAME="myWindowsVM"                     # Name of the virtual machine
     LOCATION="eastus"                         # Azure region to deploy the VM
     ADMIN_USERNAME="azureuser"                # Administrator username for the VM
     ```
   - These variables help streamline commands and ensure consistency across operations.

3. **Create Resource Group:**
   ```bash
   az group create --name $RESOURCE_GROUP --location $LOCATION
   ```

4. **Create Windows VM:**
   ```bash
   az vm create \
     --resource-group $RESOURCE_GROUP \
     --name $VM_NAME \
     --image Win2022Datacenter \
     --admin-username $ADMIN_USERNAME \
     --admin-password "YourPasswordHere" \
     --size Standard_B1ms
   ```

5. **Open RDP Port:**
   ```bash
   az vm open-port --port 3389 --resource-group $RESOURCE_GROUP --name $VM_NAME
   ```

6. **Connect via RDP:**
   - Download the RDP file from the Azure Portal and connect using the credentials provided.

---

### **Using Azure CLI:**

1. **Login to Azure CLI:**
   ```bash
   az login
   ```

2. **Set Variables for VM Creation:**
   - Set up variables in your shell environment:
     ```bash
     RESOURCE_GROUP="myResourceGroup"          # Name of the resource group
     VM_NAME="myWindowsVM"                     # Name of the virtual machine
     LOCATION="eastus"                         # Azure region to deploy the VM
     ADMIN_USERNAME="azureuser"                # Administrator username for the VM
     ```
   - These variables allow you to quickly reference values in subsequent commands.

3. **Create Resource Group:**
   ```bash
   az group create --name $RESOURCE_GROUP --location $LOCATION
   ```

4. **Create Windows VM:**
   ```bash
   az vm create \
     --resource-group $RESOURCE_GROUP \
     --name $VM_NAME \
     --image Win2022Datacenter \
     --admin-username $ADMIN_USERNAME \
     --admin-password "YourPasswordHere" \
     --size Standard_B1ms
   ```

5. **Open RDP Port:**
   ```bash
   az vm open-port --port 3389 --resource-group $RESOURCE_GROUP --name $VM_NAME
   ```

6. **Connect via RDP:**
   - Use the Azure Portal to download the RDP file and connect.

---

## **2. Creating a Linux VM (Ubuntu)**

### **Using Azure Portal:**

(Follow the steps as provided earlier in the **Using Azure Portal** section.)

---

### **Using Azure CloudShell:**

1. **Open CloudShell:**
   - Click on the **CloudShell** icon in the Azure Portal.

2. **Set Variables for VM Creation:**
   - Set up variables in CloudShell:
     ```bash
     RESOURCE_GROUP="myResourceGroup"          # Name of the resource group
     VM_NAME="myLinuxVM"                       # Name of the virtual machine
     LOCATION="eastus"                         # Azure region to deploy the VM
     ADMIN_USERNAME="azureuser"                # Administrator username for the VM
     ```
   - These variables help streamline your commands and ensure consistency.

3. **Create Resource Group:**
   ```bash
   az group create --name $RESOURCE_GROUP --location $LOCATION
   ```

4. **Create Linux VM:**
   ```bash
   az vm create \
     --resource-group $RESOURCE_GROUP \
     --name $VM_NAME \
     --image UbuntuLTS \
     --admin-username $ADMIN_USERNAME \
     --generate-ssh-keys \
     --size Standard_B1ms
   ```

5. **Open SSH Port:**
   ```bash
   az vm open-port --port 22 --resource-group $RESOURCE_GROUP --name $VM_NAME
   ```

6. **Connect via SSH:**
   - Use the public IP to connect:
     ```bash
     ssh azureuser@<YourPublicIP>
     ```

---

### **Using Azure CLI:**

1. **Login to Azure CLI:**
   ```bash
   az login
   ```

2. **Set Variables for VM Creation:**
   - Set up variables in your shell environment:
     ```bash
     RESOURCE_GROUP="myResourceGroup"          # Name of the resource group
     VM_NAME="myLinuxVM"                       # Name of the virtual machine
     LOCATION="eastus"                         # Azure region to deploy the VM
     ADMIN_USERNAME="azureuser"                # Administrator username for the VM
     ```
   - These variables will be used throughout the VM creation process.

3. **Create Resource Group:**
   ```bash
   az group create --name $RESOURCE_GROUP --location $LOCATION
   ```

4. **Create Linux VM:**
   ```bash
   az vm create \
     --resource-group $RESOURCE_GROUP \
     --name $VM_NAME \
     --image UbuntuLTS \
     --admin-username $ADMIN_USERNAME \
     --generate-ssh-keys \
     --size Standard_B1ms
   ```

5. **Open SSH Port:**
   ```bash
   az vm open-port --port 22 --resource-group $RESOURCE_GROUP --name $VM_NAME
   ```

6. **Connect via SSH:**
   - Use the Azure CLI to retrieve the public IP and connect:
     ```bash
     ssh azureuser@<YourPublicIP>
     ```

---

### **Summary**
These instructions now include clear steps for setting variables in both CloudShell and Azure CLI. This approach helps streamline the process, making it easier to manage and modify your virtual machine settings.
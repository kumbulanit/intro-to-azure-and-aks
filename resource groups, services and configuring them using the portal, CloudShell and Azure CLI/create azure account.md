Here's a step-by-step guide on how to create an Azure account, access the Azure portal, and set up the Azure CLI:

### **1. Creating an Azure Account**

#### **Step 1: Sign Up for an Azure Account**
1. **Visit the Azure Website:**
   - Go to the [Microsoft Azure website](https://azure.microsoft.com/).

2. **Click on "Start Free":**
   - On the Azure homepage, click on the "Start free" button.

3. **Sign in with Your Microsoft Account:**
   - If you have a Microsoft account, sign in. If not, create a new Microsoft account.

4. **Verify Your Identity:**
   - You'll need to provide your phone number for identity verification.
   - Enter the verification code sent to your phone.

5. **Enter Billing Information:**
   - Although you're signing up for the free account, Azure requires a credit or debit card for identity verification.
   - You'll receive $200 credit for the first 30 days and access to popular free services for 12 months.

6. **Agree to the Terms and Conditions:**
   - Review and accept the terms and conditions.

7. **Click "Sign Up":**
   - Your Azure account will be created, and you'll be redirected to the Azure portal.

### **2. Accessing the Azure Portal**

#### **Step 1: Sign in to the Azure Portal**
1. **Go to the Azure Portal:**
   - Visit [https://portal.azure.com/](https://portal.azure.com/).

2. **Sign in with Your Azure Account:**
   - Enter the email and password associated with your Azure account.

3. **Explore the Dashboard:**
   - Once signed in, you’ll see the Azure dashboard, where you can manage and create resources, view billing information, and access various Azure services.

### **3. Setting Up Azure CLI**

Azure CLI is a command-line tool that you can use to manage Azure resources directly from your terminal or command prompt.

#### **Step 1: Install Azure CLI**

**On Windows:**
1. **Download the Azure CLI Installer:**
   - Go to the [Azure CLI installation page](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) and download the MSI installer for Windows.

2. **Run the Installer:**
   - Follow the on-screen instructions to complete the installation.

3. **Verify Installation:**
   - Open a command prompt and type:
     ```bash
     az --version
     ```
   - This will display the installed version of Azure CLI.

**On macOS:**
1. **Install via Homebrew:**
   - If you have Homebrew installed, run the following command in the terminal:
     ```bash
     brew install azure-cli
     ```

2. **Verify Installation:**
   - After installation, check the installed version by typing:
     ```bash
     az --version
     ```

**On Linux:**
1. **Install via Package Manager:**
   - For Ubuntu/Debian-based distributions, run:
     ```bash
     curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
     ```

2. **Verify Installation:**
   - Check the installed version by typing:
     ```bash
     az --version
     ```

#### **Step 2: Sign In to Azure CLI**
1. **Login to Azure:**
   - Open your terminal or command prompt and type:
     ```bash
     az login
     ```
   - A browser window will open asking you to sign in to your Azure account.

2. **Enter Your Credentials:**
   - Sign in with your Azure account credentials.
   - Once signed in, the terminal will display a list of your subscriptions.

#### **Step 3: Start Using Azure CLI**
1. **Check Available Commands:**
   - Type `az` to see a list of available commands you can use to manage Azure resources.

2. **Create Resources Using Azure CLI:**
   - You can now create and manage resources using Azure CLI commands, like creating resource groups, virtual machines, and more.

### **Summary**
- **Creating an Azure Account** involves signing up on the Azure website, verifying your identity, and providing billing information.
- **Accessing the Azure Portal** allows you to manage resources via a graphical interface.
- **Setting Up Azure CLI** gives you command-line access to Azure, enabling resource management directly from your terminal.### **3. Setting Up and Using Azure CLI on Windows**

#### **Step 1: Install Azure CLI on Windows**

1. **Download the Azure CLI Installer:**
   - Go to the [Azure CLI installation page](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) and download the MSI installer for Windows.

2. **Run the Installer:**
   - Double-click the downloaded `.msi` file.
   - Follow the installation wizard’s instructions, accepting the default settings.
   - Click "Finish" when the installation is complete.

3. **Verify Installation:**
   - Open the Command Prompt or PowerShell.
   - Type the following command to check the installation:
     ```bash
     az --version
     ```
   - This will display the installed version of Azure CLI, confirming that it’s correctly installed.

#### **Step 2: Sign In to Azure CLI on Windows**

1. **Open Command Prompt or PowerShell:**
   - Press `Win + R`, type `cmd` or `powershell`, and press Enter.

2. **Login to Azure:**
   - In the Command Prompt or PowerShell, type:
     ```bash
     az login
     ```
   - A web browser will open prompting you to sign in to your Azure account.

3. **Sign In with Your Azure Credentials:**
   - Enter your Azure account email and password.
   - After successful login, the browser will display a confirmation message, and the Command Prompt will show your subscription details.

#### **Step 3: Set Up Azure CLI Environment Variables (Optional)**

1. **Configure Default Subscription:**
   - If you have multiple subscriptions, set a default subscription using:
     ```bash
     az account set --subscription "Subscription-Name"
     ```
   - Replace `"Subscription-Name"` with the actual name of your subscription.

2. **Set Environment Variables in Windows:**
   - To set environment variables for use in Azure CLI commands, use the following command:
     ```bash
     setx AZURE_SUBSCRIPTION "<Your-Subscription-Name>"
     setx AZURE_REGION "eastus"
     ```
   - Replace `"<Your-Subscription-Name>"` with your subscription name and `"eastus"` with your preferred region.

3. **Verify Environment Variables:**
   - To check the environment variables, use:
     ```bash
     echo %AZURE_SUBSCRIPTION%
     echo %AZURE_REGION%
     ```

#### **Step 4: Using Azure CLI on Windows**

1. **Create a Resource Group:**
   - To create a new resource group, use:
     ```bash
     az group create --name MyResourceGroup --location eastus
     ```
   - Replace `MyResourceGroup` with your preferred resource group name.

2. **Create a Virtual Machine (Windows Server):**
   - To create a Windows Server virtual machine:
     ```bash
     az vm create --resource-group MyResourceGroup --name MyWinVM --image Win2019Datacenter --admin-username azureuser --admin-password MyPassword123! --size Standard_B1s
     ```
   - Replace `MyResourceGroup`, `MyWinVM`, `azureuser`, and `MyPassword123!` with your preferred resource group name, VM name, admin username, and password.

3. **Create a Virtual Machine (Linux):**
   - To create a Linux virtual machine (e.g., Ubuntu):
     ```bash
     az vm create --resource-group MyResourceGroup --name MyLinuxVM --image UbuntuLTS --admin-username azureuser --authentication-type ssh --ssh-key-value ~/.ssh/id_rsa.pub --size Standard_B1s
     ```
   - Replace `MyResourceGroup`, `MyLinuxVM`, `azureuser`, and `~/.ssh/id_rsa.pub` with your preferred resource group name, VM name, admin username, and SSH public key path.

4. **Access the Virtual Machine:**
   - **Windows VM (RDP):**
     ```bash
     mstsc /v:YourPublicIPAddress
     ```
   - **Linux VM (SSH):**
     ```bash
     ssh azureuser@YourPublicIPAddress
     ```
   - Replace `YourPublicIPAddress` with the public IP address of your virtual machine.

### **Summary**
- **Azure CLI on Windows** allows you to manage Azure resources directly from Command Prompt or PowerShell.
- **Setting Environment Variables** simplifies command usage by defining default values.
- **Using Azure CLI** enables the creation and management of virtual machines, resource groups, and more directly from the command line.
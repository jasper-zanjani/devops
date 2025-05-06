# Create LRS storage account
az storage account create \
    --name $STORAGE_ACCOUNT_NAME
    --resource-group $RESOURCE_GROUP
    --location $REGION
    --sku Standard_LRS

# Confirm
az storage account show -n $STORAGE_ACCOUNT_NAME

# Allow public access to blobs
az storage account update \
    --name $STORAGE_ACCOUNT_NAME \
    --allow-blob-public-access

# Display access keys
az storage account keys list \
    -n $STORAGE_ACCOUNT_NAME

# Bypass network rules to allow access for Azure services like Event Hub and Recovery Services Vault
# Display exceptions for the storage account network rules
az storage account show -g $g -n $n --query networkRuleSet.bypass

# Configure exceptions to storage account network rules
az storage account update -g $g -n $n --bypass Logging Metrics AzureServices

# Display virtual network rules
az storage account network-rule list -g $rgName -n $n --query virtualNetworkRules


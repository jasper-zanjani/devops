az storage account create -n $NAME -g $GROUP -l $REGION \
    --sku "Standard_LRS"

az storage account show -n $NAME

# Allow public access to blobs
az storage account update -n $NAME -g $GROUP \
    --allow-blob-public-access

# Configure exceptions to storage account network rules
az storage account update -n $NAME -g $GROUP \
    --bypass Logging Metrics AzureServices

# Bypass network rules to allow access for Azure services like Event Hub and Recovery Services Vault
# Display exceptions for the storage account network rules
az storage account show -n $NAME -g $GROUP \
    --query "networkRuleSet.bypass"

az storage account keys list \
    -n $STORAGE_ACCOUNT_NAME

az storage account network-rule list -n $NAME -g $GROUP \
    --query "virtualNetworkRules"


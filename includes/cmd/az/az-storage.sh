# Upload file as blob to new container
az storage container create --account-name $STORAGE_ACCOUNT --name $CONTAINER_NAME --public-access off

# Display virtual network rules
az storage account network-rule list -g $rgName -n $n --query virtualNetworkRules

# Enable service endpoint for Azure Storage on an existing virtual network and subnet.
az network vnet subnet update -g $rgName --vnet-name $n --name "mysubnet" --service-endpoints "Microsoft.Storage"
# Bypass network rules to allow access for Azure services like Event Hub and Recovery Services Vault
# Display exceptions for the storage account network rules
az storage account show -g $g -n $n --query networkRuleSet.bypass

# Configure exceptions to storage account network rules
az storage account update -g $g -n $n --bypass Logging Metrics AzureServices

# Generate SAS token
az storage blob generate-sas \
    --account-name $STORAGE_ACCT_NAME --account-key $STORAGE_ACCT_KEY \
    --container-name $CONTAINER_NAME --name $BLOB_NAME \
    --permissions r --expiry $EXPIRY_DATE

# Create Recovery Services Vault
az backup vault create -g $RG_NAME -n $VAULT_NAME --Location $LOCATION

# Define new backup protection policy
# GRS by default
az backup protection enable-for-vm -g $RG_NAME --vault-name $VAULT_NAME --vm $VM_NAME --policy-name $POLICY_NAME

# Set redundancy to LRS
az backup vault backup-properties set -n $v -g $RG_NAME --backup-storage-redundancy "LocallyRedundant"

# List containers
# backup-management-type accepts the following values:
# - AzureIaasVM
# - AzureStorage
# - AzureWorkload
az backup container list -g $RG_NAME --vault-name $VAULT_NAME \
    --backup-management-type AzureIaasVM 

# Preserve only the "name" attribute of the first item, which itself is a semicolon-delimited string of values. 
az backup container list -g $RG_NAME --vault-name $VAULT_NAME \
    --backup-management-type AzureIaasVM --query '[0].name'

# Initiate VM backup
az backup protection backup-now -g $RG_NAME -n $VAULT_NAME --container-name $CONT_NAME
    --item-name myVM --retain-until 18-10-2017 --backup-management-type AzureIaasVM

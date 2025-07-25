# Location is required when creating a new vault
az backup vault create -n $VAULT_NAME -g $RG_NAME -l $LOCATION

az backup vault show -n $VAULT_NAME -g $RG_NAME

# Display all recovery services vaults in a subscription
az backup vault list 

# Set redundancy to LRS
az backup vault backup-properties set -n $VAULT_NAME -g $RG_NAME --backup-storage-redundancy "LocallyRedundant"


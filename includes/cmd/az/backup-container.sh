# List containers
az backup container list -g $RG_NAME -v $VAULT_NAME \
    --backup-management-type AzureIaasVM # (1)


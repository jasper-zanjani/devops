# Display backed up items within a container
az backup item list -v $VAULT_NAME -g $RG_NAME

# Display only a specified backup operation, i.e. Backup, ConfigureBackup, etc
az backup item list -v $VAULT_NAME -g $RG_NAME \
    --operation ConfigureBackup


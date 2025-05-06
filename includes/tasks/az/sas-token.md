```sh title="Generate SAS token"
az storage blob generate-sas \
    --account-name $STORAGE_ACCOUNT_NAME \
    --account-key $STORAGE_ACCOUNT_KEY \
    --container-name $STORAGE_CONTAINER_NAME \
    --name $BLOB_NAME \
    --permissions r \
    --expiry $EXPIRY_DATE
```

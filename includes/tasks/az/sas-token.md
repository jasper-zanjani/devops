```sh title="Generate SAS token"
az storage blob generate-sas \
    --account-name $STORAGE_ACCT_NAME --account-key $STORAGE_ACCT_KEY \
    --container-name $CONTAINER_NAME --name $BLOB_NAME \
    --permissions r --expiry $EXPIRY_DATE
```

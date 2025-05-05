```sh title="Upload blobs"
az storage blob upload \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container $CONTAINER_NAME \
    --file $FILE_PATH

# Confirm
az storage blob list \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container $CONTAINER_NAME
```

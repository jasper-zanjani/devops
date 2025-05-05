```sh title="Display storage endpoint of a blob"
az storage blob url \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $CONTAINER_NAME \
    --name $BLOB_NAME
```

```sh title="Allow public access to blobs"
az storage account update \
    --name $STORAGE_ACCOUNT_NAME \
    --allow-blob-public-access
```

```sh title="Display storage endpoint of a blob"
az storage blob url \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $CONTAINER_NAME \
    --name $BLOB_NAME

# Test access
az storage blob url --account-name $STORAGE_ACCOUNT_NAME -c $CONTAINER_NAME -n $BLOB_NAME |
    jq -r '.' | xargs curl
```


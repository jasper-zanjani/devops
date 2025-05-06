```sh title="Create container"
az storage container create \
    --account-name $STORAGE_ACCOUNT_NAME \
    --name $CONTAINER_NAME

# Confirm
az storage container exists \
    --account-name $STORAGE_ACCOUNT_NAME \
    -n $CONTAINER_NAME

az storage container list \
    --account-name $STORAGE_ACCOUNT_NAME
```

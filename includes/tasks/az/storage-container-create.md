```sh title="Create container"
az storage container create \
    --account-name $STORAGE_ACCOUNT_NAME \
    --name $CONTAINER_NAME

# Confirm
az storage container exists -n $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
az storage container list --acount-name $STORAGE_ACCOUNT_NAME
```

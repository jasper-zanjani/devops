```sh title="Create container"
az storage container create --account-name $ACCOUNT -n $CONTAINER

az storage container exists --account-name $ACCOUNT -n $CONTAINER

az storage container list --account-name $ACCOUNT
```

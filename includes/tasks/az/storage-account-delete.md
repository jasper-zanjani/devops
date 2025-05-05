Storage accounts can be deleted by providing either by providing a single argument to **--ids** or by providing **--name** as well as **--resource-group**

```sh title="Delete storage account"
az storage account delete -n $STORAGE_ACCOUNT_NAME -g $RESOURCE_GROUP
```

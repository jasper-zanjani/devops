Without specifying an argument to **--file**, the file contents will be written to stdout.

```sh title="Download a file"
az storage blob download \
    --account-name $STORAGE_ACCOUNT_NAME
    --container-name $CONTAINER_NAME
    --name $BLOB_NAME
    --file $FILE_PATH
```

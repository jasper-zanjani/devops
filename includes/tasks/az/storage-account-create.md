The minimum information needed to create a locally-redundant storage account is an argument to **--sku** (the default value is `Standard_RAGRS`).
The default values for other options are as follows:

-   **--access-tier**: `Hot`
-   **--allow-blob-public-access**: `false`
-   **--min-tls-version**: `TLS1_0`
-   **--kind**: `StorageV2`

```sh title="Create Standard LRS storage account"
az storage account create \
    --name $STORAGE_ACCOUNT_NAME
    --resource-group $RESOURCE_GROUP
    --location $REGION
    --sku Standard_LRS

# Confirm
az storage account show -n $STORAGE_ACCOUNT_NAME
```


```sh
az storage account create \
    --name $STORAGE_ACCOUNT_NAME \
    --resource-group $RESOURCE_GROUP \
    --location $REGION \
    --kind $TIER\
    --sku $REDUNDANCY \
    --encryption-services "blob" \
    --output "none" \
    --min-tls-version "TLS1_2" \
    --allow-blob-public-access "true"
```

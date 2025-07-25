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

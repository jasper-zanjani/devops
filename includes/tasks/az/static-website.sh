# Create a storage account
az storage account create -n $NAME -g $GROUP \
    --sku "Standard_LRS"
    --default-action "Allow"

STORAGE_KEY=$(az storage account keys list -g $GROUP --account-name $NAME --query '[0].value')
az storage blob service-properties update \
    --account-name $NAME \
    --account-key $STORAGE_KEY \
    --static-website \
    --404-document "404.html" \
    --index-document "index.html"

# Upload contents (probably needs a container to be created first) (1)
az storage blob upload-batch --account-name $NAME 
    --destination $CONTAINER
    --source $SOURCE_PATH

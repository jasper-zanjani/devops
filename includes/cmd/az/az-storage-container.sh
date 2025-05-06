# Create container
az storage container create \
    --account-name $STORAGE_ACCOUNT_NAME \
    --name $STORAGE_CONTAINER_NAME \
    --public-access off

# Set public access on for the container
az storage container set-permission \
    --account-name $STORAGE_ACCOUNT_NAME \
    -n $STORAGE_CONTAINER_NAME \
    --public-access container

# Confirm
az storage container exists \
    --account-name $STORAGE_ACCOUNT_NAME
    -n $CONTAINER_NAME 

az storage container list \
    --account-name $STORAGE_ACCOUNT_NAME

# Enable service endpoint for Azure Storage on an existing virtual network and subnet.
az network vnet subnet update -g $rgName --vnet-name $n --name "mysubnet" --service-endpoints "Microsoft.Storage"

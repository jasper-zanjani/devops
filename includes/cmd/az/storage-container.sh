# Create container (public by default)
az storage container create --account-name $ACCOUNT -n $CONTAINER

# Create private container
az storage container create --account-name $ACCOUNT -n $CONTAINER \
    --public-access off

# Enable public access for container
az storage container set-permission --account-name $ACCOUNT -n $CONTAINER \
    --public-access container

az storage container exists --account-name $ACCOUNT -n $CONTAINER 

az storage container list \
    --account-name $ACCOUNT

# Enable service endpoint for Azure Storage on an existing virtual network and subnet.
az network vnet subnet update -g $rgName --vnet-name $n --name "mysubnet" --service-endpoints "Microsoft.Storage"

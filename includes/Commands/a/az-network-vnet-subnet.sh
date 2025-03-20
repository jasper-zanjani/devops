# Display subnets of a vnet
az network vnet subnet list -g $RG_NAME --vnet-name $VNET_NAME

# Create a subnet, providing name, resource group, and vnet name
az network vnet subnet create -n $SUBNET_NAME -g $RG_NAME --vnet-name $VNET_NAME

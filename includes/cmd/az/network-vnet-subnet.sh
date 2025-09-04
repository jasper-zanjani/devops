az network vnet subnet create \
    -g $GROUP --vnet-name $VNET -n $SUBNET_NAME 

az network vnet subnet list \
    -g $GROUP --vnet-name $VNET


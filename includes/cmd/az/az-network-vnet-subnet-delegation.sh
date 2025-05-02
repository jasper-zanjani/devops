# Subnet delegation
az network vnet subnet update -g $RG_NAME -n $SUBNET_NAME --vnet-name $VNET_NAME \
    --delegations Microsoft.Sql/managedInstances

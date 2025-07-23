# Subnet delegation
az network vnet subnet update \
    --resource-group $RESOURCE_GROUP \
    --name $SUBNET_NAME \
    --vnet-name $VNET_NAME \
    --delegations "Microsoft.Sql/managedInstances"

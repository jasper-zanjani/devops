# Subnet delegation
az network vnet subnet update \
    -g $GROUP -n $SUBNET_NAME --vnet-name $VNET \
    --delegations "Microsoft.Sql/managedInstances"

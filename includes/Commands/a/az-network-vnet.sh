az network vnet list

# Create a vnet, using default address prefix of 10.0.0./16
az network vnet create -n $VNET_NAME -g $RG_NAME -l $LOCATION

# Inspect specified vnet
az network vnet show -n $VNET_NAME -g $RG_NAME

--8<-- "includes/Commands/a/az-network-vnet-subnet.sh"

# Create a vnet and subnets at the same time (using default address prefix)
az network vnet create -n $VNET_NAME -g $RG_NAME -l $LOCATION \
    --subnet-name $SUBNET_NAME --subnet-prefixes $SUBNET_PREFIXES

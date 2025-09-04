# Create a vnet, using default address prefix of 10.0.0./16
az network vnet create -g $GROUP -n $VNET -l $LOCATION

--8<-- "includes/cmd/az/network-vnet-subnet.sh"

# Create a vnet and subnets at the same time (using default address prefix)
az network vnet create -g $GROUP -n $VNET -l $LOCATION \
    --subnet-name $SUBNET_NAME --subnet-prefixes $SUBNET_PREFIXES

az network vnet show -n $VNET -g $GROUP

az network vnet list


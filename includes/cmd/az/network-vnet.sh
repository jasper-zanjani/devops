# List VNets
az network vnet list

# Display specified VNet
az network vnet show \
  -n $VNET -g $GROUP

# Create a vnet, using default address prefix of 10.0.0./16
az network vnet create \
  -g $GROUP -n $VNET -l $LOCATION

# Create a vnet and subnets at the same time (using default address prefix)
az network vnet create --subnet-name $SUBNET_NAME --subnet-prefixes $SUBNET_PREFIXES
  -g $GROUP -n $VNET -l $LOCATION \

# List VNet's subnets
az network vnet subnet list \
    -g $GROUP --vnet-name $VNET

# Create subnet
az network vnet subnet create \
    -g $GROUP --vnet-name $VNET -n $SUBNET_NAME 


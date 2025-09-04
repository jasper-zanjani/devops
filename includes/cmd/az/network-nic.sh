# Create a network interface
az network nic create -n $NIC_NAME -g $RG_NAME -l $LOCATION \
    --vnet-name $VNET_NAME --subnet $SUBNET_NAME --network-security-group $NSG_NAME --public-ip-address $IP_NAME 

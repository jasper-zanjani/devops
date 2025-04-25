```sh title="Virtual network service endpoint"
# Display virtual network rules
az storage account network-rule list -g $rgName -n $n --query virtualNetworkRules

# Enable service endpoint for Azure Storage on an existing virtual network and subnet.
az network vnet subnet update -g $rgName --vnet-name $n --name "mysubnet" --service-endpoints "Microsoft.Storage"

# Add network rule for VNet and subnet
subnetid=$(az network vnet subnet show -g $ng --vnet-name $nn -n "mysubnet" --query id --output tsv)
az storage account network-rule add -g $sg -n $sn --subnet $subnetid
```

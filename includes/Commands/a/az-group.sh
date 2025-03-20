# Create new resource group
az group create -n $RG_NAME -l $LOCATION

# Check if a specified resource group exists
az group exists -n $RG_NAME

# Deploy to a resource group
az deployment group create -g $GROUP --template-file $TEMPLATE_FILE_PATH

# Deploy to a subscription
az deployment sub create -l $LOCATION --template-file $TEMPLATE_FILE_PATH

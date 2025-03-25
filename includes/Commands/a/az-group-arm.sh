# Capture a resource group as an ARM template
az group export --name $RG_NAME

# Pass a template file during deployment
az group deployment create --name $DEPLOYMENT_NAME --resource-group $RG_NAME \
    --template-file AppTemplate.json --parameters @dev-env.json

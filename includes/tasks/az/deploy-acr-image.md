```sh title="Deploy image from Azure Container Registry"
az webapp create -g $RG_NAME -n $n
    --plan $p 
    --deployment-container-image-name $registry.azurecr.io/$image:latest

az webapp config appsettings set -g $RG_NAME -n $n 
    --settings "WEBSITES_PORT=8000"

# Service principal ID
$p = az webapp identity assign -g $RG_NAME -n $n -o tsv
    --query principalId 

$s = az account show -o tsv
    --query id 

# Grant web app permission to access the container registry
az role assignment create 
    --assignee $p 
    --scope /subscriptions/$s/resourceGroups/$g/provides/Microsoft.ContainerRegistry/registries/$registry

# Deploy image
az webapp config container set -g $RG_NAME -n $n 
    --docker-custom-image-name $registry.azurecr.io/$image:latest 
    --docker-registry-server-url https://$registry.azurecr.io

az webapp restart -n $n -g $g
```

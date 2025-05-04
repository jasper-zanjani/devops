az webapp list-runtimes --linux
az webapp create -n $n -g $RG_NAME 
    --plan $p

az webapp create -g $RG_NAME -n $n
    --plan $p 
    --deployment-container-image-name $registry.azurecr.io/$image:latest

az webapp config appsettings set -g $RG_NAME -n $n 
    --settings "WEBSITES_PORT=8000"

# Get service principal ID
az webapp identity assign -g $RG_NAME -n $n -o tsv
    --query principalId 

# Deploy image
az webapp config container set -g $RG_NAME -n $n 
    --docker-custom-image-name $registry.azurecr.io/$image:latest 
    --docker-registry-server-url https://$registry.azurecr.io

az webapp restart -n $n -g $g

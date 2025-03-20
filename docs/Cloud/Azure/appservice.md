Web applications must be organized under an **App Service plan**, which defines compute resources for a web app. (1)
{: .annotate }

1.  

    !!! example "Links"

        -   [What are Azure App Service plans?](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)

        -   [Host a web application with Azure App Service](https://learn.microsoft.com/en-us/training/modules/host-a-web-app-with-azure-app-service/)
        
    !!! tip "Pricing tiers"

        <div class="grid cards" markdown>

        -   **Free/Shared**

            Uses a shared infrastructure with minimal storage. No options for deploying different staged versions, routing of traffic, or backups

        -   **Basic**

            Dedicated compute for app, including avaiilability of SSL and manual scaling of app instance number.

        -   **Standard**

            Daily backups, automatic scaling of app instances, deployment slots, and user routing with Traffic Manager

        -   **Premium**

            More frequent backups, increased storage, and greater number of deployment slots and instance scaling options.

        </div>

    

#### Tasks

- [Static website hosting in Azure Storage](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website): actually appears to deal with mostly Azure storage account




```sh
az appservice plan create -g $RG_NAME -n $p
    --is-linux

az webapp list-runtimes --linux

az webapp create -n $n -g $RG_NAME 
    --plan $p
```

```sh title="Deploy from GitHub"
az appservice plan create -g $rg -n $p
    --sku FREE

az webapp create -g $rg -n $webappname 
    --plan $p

az webapp deployment source config -g $rg -n $webappname 
    --repo-url $gitrepo 
    --branch master 
    --manual-integration

# Web app will be available at http://$webappname.azurewebsites.net
```


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

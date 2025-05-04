# Azure App Service

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

--8<-- "includes/tasks/az/deploy-acr-image.md"


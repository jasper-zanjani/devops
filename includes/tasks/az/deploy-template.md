```sh
TEMPLATE_URI="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-windows/azuredeploy.json" # (1)

# Validate template
az deployment group validate \
    --resource-group $RG \
    --template-uri $TEMPLATE_URI \
    --parameters adminUsername=$USERNAME \
    --parameters adminPassword=$PASSWORD \
    --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX

# Deploy template
az deployment group create \
    --name $DEPLOYMENT_NAME \
    --resource-group $RG \
    --template-uri $TEMPLATE_URI \
    --parameters adminUsername=$USERNAME \
    --parameters adminPassword=$PASSWORD \
    --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX

# Verify deployment
az deployment group show \
    --name $DEPLOYMENT_NAME \
    --resource-group $RG
```

1.  
    
    ```json
    {
      "name": "[concat(variables('vmName'), '/', 'ConfigureIIS')]",
      "type": "Microsoft.Compute/virtualMachines/extensions",
      "apiVersion": "2018-06-01",
      "location": "[parameters('location')]",
      "properties": {
        "publisher": "Microsoft.Compute",
        "type": "CustomScriptExtension",
        "typeHandlerVersion": "1.9",
        "autoUpgradeMinorVersion": true,
        "settings": {
          "fileUris": [
            "https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-iis.ps1"
          ]
        },
        "protectedSettings": {
          "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File configure-iis.ps1"
        }
      },
      "dependsOn": [
        "[resourceId('Microsoft.Compute/virtualMachines/', variables('vmName'))]"
      ]
    }
    ```

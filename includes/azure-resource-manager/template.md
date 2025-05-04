An ARM [**template**](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) is a JSON file that precisely defines all ARM resources in a deployment. 
It can be [targeted](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-cli#deployment-scope) to a resource group, subscription, management group, or tenant.

```sh
--8<-- "includes/cmd/az/az-deployment.sh"
```

ARM templates are typically adapted from existing **Azure Quickstart** templates, which are contributed by the community and hosted on a [gallery](https://azure.microsoft.com/resources/templates). 
The **Azure Resource Manager Visualizer** assists users in seeing what the template will do before actually deploying.

The [Custom Script Extension](https://docs.microsoft.com/en-us/learn/modules/build-azure-vm-templates/5-add-a-resource) is a way to run scripts on Azure VMs and represents one of the ways to automate configuration of new deployments. 

If you export a deployment to a template, only the resources deployed in that deployment will be templatized. In the case of a complex deployment that had several phases, the ultimate result of the deployment can be obtained by exporting the template from the resource group.

A template **must** have at least the following sections.

- `$schema`
- `contentVersion`
- [`resources`](#resources "Contains definitions of the deployment's resources")

A template may have the following optional sections

```json
{
  "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "",
  "parameters": {  },
  "variables": {  },
  "functions": [  ],
  "resources": [  ],
  "outputs": {  }
}
```
<div class="grid cards" markdown>

</div>



### Resources


```json
<!-- Create a public IP address. -->
{ 
  "type": "Microsoft.Network/publicIPAddresses",
  "apiVersion": "2018-08-01",
  "name": "[variables('publicIPAddressName')]",
  "location": "[parameters('location')]",
  "properties": 
  {
    "publicIPAllocationMethod": "Dynamic",
    "dnsSettings": 
    {
      "domainNameLabel": "[parameters('dnsLabelPrefix')]" 
    } 
  } 
}
```

```json
<!-- Create a storage account -->
{ 
  "type": "Microsoft.Storage/storageAccounts",
  "apiVersion": "2019-06-01",
  "name": "[variables('storageAccountName')]",
  "location": "[parameters('location')]",
  "sku": 
  {
    "name": "[parameters('storageAccountType')]"
  },
  "kind": "StorageV2",
  "properties": {} 
}
```

### Parameters

```json
"adminUsername": {
  "type": "string",
  "metadata": {
    "description": "Username for the Virtual Machine." }},
"adminPassword": {
  "type": "securestring",
  "metadata": {
    "description": "Password for the Virtual Machine." }}
```

[Simple storage account](https://github.com/Azure/azure-quickstart-templates/blob/master/101-storage-account-create/azuredeploy.json#L27)

```json
{ "storageAccountType": {
    "type": "string",
    "defaultValue": "Standard_LRS",
    "allowedValues": [
      "Standard_LRS",
      "Standard_GRS",
      "Standard_ZRS",
      "Premium_LRS" ],
    "metadata": {
      "description": "Storage Account type" }},
  "location": {
    "type": "string",
    "defaultValue": "[resourceGroup().location]",
    "metadata": {
      "description": "Location for all resources." }}}
```

### Variables

```json
{ "nicName": "myVMNic",
  "addressPrefix": "10.0.0.0/16",
  "subnetName": "Subnet",
  "subnetPrefix": "10.0.0.0/24",
  "publicIPAddressName": "myPublicIP",
  "virtualNetworkName": "MyVNET" }
```

[Simple storage account](https://github.com/Azure/azure-quickstart-templates/blob/master/101-storage-account-create/azuredeploy.json#L27)

```json
{ "storageAccountName": "[concat('store', uniquestring(resourceGroup().id))]" },
```

### Functions

Create a globally unique name, useful for some resources that require it. `concat` is a built-in function.
```json
[ 
  { "namespace": "contoso",
    "members": {
      "uniqueName": {
        "parameters": [
          {
            "name": "namePrefix",
            "type": "string"
          }
        ],
        "output": {
          "type": "string",
          "value": "[concat(toLower(parameters('namePrefix')), uniqueString(resourceGroup().id))]" 
        }
      }
    }
  }
]
```

### Outputs

```json
"outputs": {
  "hostname": {
    "type": "string",
    "value": "[reference(variables('publicIPAddressName')).dnsSettings.fqdn]"
  }
}
```

[Standard storage account](https://github.com/Azure/azure-quickstart-templates/tree/master/101-storage-account-create)


```json
{
  "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "",
  "parameters": {  },
  "variables": {  },
  "functions": [  ],
  "resources": [  ],
  "outputs": {
    "storageAccountName": 
  {
      "type": "string",
      "value": "[variables('storageAccountName')]"
    }
  }
}
```


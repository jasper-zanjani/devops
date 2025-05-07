# Output values

[Output values](https://developer.hashicorp.com/terraform/language/values/outputs) make information about infrastructure available on the command-line.
Outputs must be defined in the configuration and are displayed after a configuration run and are also stored in the state data.

For example, an output can be defined for an Azure resource group:

```terraform
--8<-- "includes/tf/azurerm_resource_group.tf"

output "resource_group_location" {
  value = azurerm_resource_group.rg-tf.location
}
```

This can be displayed at the terminal:

```sh
terraform output # => resource_group_location = "eastus"

terraform output resource_group_location # => "eastus"
```

The `-raw` option allows output to be used in other commands by removing quotes and the final newline:

```sh
# Add new context to .kube/config
aws eks update-kubeconfig \
    --region $(terraform output -raw region) \
    --name $(terraform output -raw cluster_name)
```

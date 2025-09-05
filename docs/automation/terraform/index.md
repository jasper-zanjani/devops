# Overview

??? tip

    --8<-- "includes/cmd/terraform/info.md"

Terraform configurations are written most commonly in [HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration), (1) or less commonly in JSON.
{: .annotate }

1.  

    ```terraform title="Syntax"
    block_type "label" "name_label" {
        key = "value"
        nested_block {
            key = "value"
        }
    }
    ```

```terraform title="Hello, World!"
--8<-- "includes/tf/00-helloworld.tf"
```


The most basic Terraform file uses an API key to connect to the provider service.
Many providers are available for Terraform, but most of them are cloud-based.


=== "azurerm"

    ```terraform
    --8<-- "includes/tf/azurerm_provider.tf"
    ```

=== "ibm"

    ```terraform
    --8<-- "includes/tf/ibm/provider.tf"
    ```

## Output values

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

## Variables

[Variables](https://developer.hashicorp.com/terraform/language/values/variables){: #variables } allow values to be substituted without altering a module's source code.
Variables are declared in a variable block (1).  
{: .annotate }

1.  

    ```terraform title="Variable definition"
    variable "name_label" {
      type = value
      description = "string"
      default = value
      sensitive = bool
    }
    ```

    -   Setting a variable as [`sensitive`](https://developer.hashicorp.com/terraform/language/values/variables#suppressing-values-in-cli-output) will suppress its output when running `plan` or `apply`.

<!-- -->

Values can be [provided](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables) in various ways:

-   Files in the project directory named **terraform.tfvars** and **.auto.tfvars** are automatically parsed.

-   Other variable definition files can be specified by passing their filenames to **-var-file**. 

-   Individual variable values can be passed from the command-line using **-var**

-   Environment variables prefixed with **`TF_VAR_`**

Placing sensitive values in variable definition files allows sensitive data, such as passwords, API keys, or tokens, to be kept secret.

Terraform configurations mostly contain three types of object:

- **Providers** provide information about a provider plugin, i.e. AWS. There are various tiers of providers: official, partner, and community.  
- **Resources** are what is created within a target environment, i.e. a VM or a database
- **Data sources** are ways to query information from a provider.


## Provisioners

**Provisioners** model specific actions in order to prepare servers or other infrastructure objects for service.
Provisioners are described as a last resort in Terraform documentation because their actions cannot be modeled as part of a plan.

[**local-exec**](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec) invokes a local executable.

```terraform
provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
}
```

There is also a [null resource provisioner](https://developer.hashicorp.com/terraform/language/resources/provisioners/null_resource)

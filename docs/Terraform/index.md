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


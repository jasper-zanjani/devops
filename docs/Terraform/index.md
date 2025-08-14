# Overview

??? tip

    ```sh
    --8<-- "includes/cmd/terraform/terraform.sh"
    ```

Terraform configurations are written most commonly in [HCL](https://developer.hashicorp.com/terraform/language/syntax/configuration), or less commonly in JSON.


<div class="grid cards" markdown>

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

</div>

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


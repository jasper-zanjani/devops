# Sharing state

State can be shared between Terraform modules by creating a root modules which refers to both using [Module blocks](https://developer.hashicorp.com/terraform/language/modules/syntax).

In this context, all data is passed between modules (and between root module and child) explicitly.

-   `subscription_id` provided as a variable to root, is passed to both children (1)
    {: .annotate }

    1.  

        ```terraform hl_lines="8 13 17"
        --8<-- "includes/tf/sharing-state/main.tf"
        ```

-   `group` is exported as an Output from **modules/resource\_group** (1) to the root module (2) and then to **modules/data**, where it is treated as variable. (3)
    {: .annotate }

    1.  

        ```terraform hl_lines="24-26" title="modules/resource_group/main.tf"
        --8<-- "includes/tf/sharing-state/modules/resource_group/main.tf"
        ```

    2.  

        ```terraform hl_lines="14" title="main.tf"
        --8<-- "includes/tf/sharing-state/main.tf"
        ```

    3.  

        ```terraform hl_lines="24" title="modules/data/main.tf"
        --8<-- "includes/tf/sharing-state/modules/data/main.tf"
        ```

=== "main.tf"

    ```terraform
    --8<-- "includes/tf/sharing-state/main.tf"
    ```

=== "modules/resource_group/main.tf"

    ```terraform
    --8<-- "includes/tf/sharing-state/modules/resource_group/main.tf"
    ```

=== "modules/data/main.tf"

    ```terraform
    --8<-- "includes/tf/sharing-state/modules/data/main.tf"
    ```

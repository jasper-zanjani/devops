# Output and data providers

[Output values](https://developer.hashicorp.com/terraform/language/values/outputs) make information about infrastructure available on the command-line.

Invariably, these will often depend on data providers.

!!! example

    This example will display the ID of the specified Power subnet.

    ```terraform hl_lines="1-3" title="ibm-pi-subnet-inspect.tf"
    --8<-- "includes/tasks/ibm_pi_subnet-inspect.tf"
    ```

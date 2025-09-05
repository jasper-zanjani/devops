Expanding a disk is much easier to do using the terminal than Terraform.

=== "Terminal"

    ```sh
    # Update size of existing volume
    ibmcloud pi vol upd $VOLUME_ID -s 30
    ```

=== ":material-terraform: Terraform"
    
    !!! warning

        When making changes to an existing disk, the disk must be imported using the following command.
        Otherwise, applying the module will cause an error because a volume with the name already exists.

        ```sh
        terraform import ibm_pi_volume.volume $WORKSPACE_ID/$VOLUME_ID
        ```

    === "main.tf"

        ```terraform
        --8<-- "includes/tf/ibm/expand-disk/main.tf"
        ```

    === "providers.tf"

        ```terraform
        --8<-- "includes/tf/ibm/expand-disk/providers.tf"
        ```

    === "variables.tf"

        ```terraform
        --8<-- "includes/tf/ibm/expand-disk/variables.tf"
        ```


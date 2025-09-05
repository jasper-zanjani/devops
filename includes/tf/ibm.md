!!! example

    === "main.tf"

        ```terraform
        --8<-- "includes/tf/ibm_pi_instance/full/main.tf"
        ```

    === "variables.tf"

        ```terraform
        --8<-- "includes/tf/ibm_pi_instance/full/variables.tf"
        ```

    === "outputs.tf"

        ```terraform
        --8<-- "includes/tf/ibm_pi_instance/full/outputs.tf"
        ```

    === "providers.tf"

        ```terraform
        --8<-- "includes/tf/ibm_pi_instance/full/provider.tf"
        ```


The IBM Cloud **Power Virtual Server service (PowerVS)** is supported by a [Terraform module](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest).

-   PowerVS infrastructure must be deployed to [supported regions](https://cloud.ibm.com/apidocs/power-cloud#endpoint) and the IBM provider requires a zone to be specified (short name only, i.e. `dal10`).

-   The Terraform attribute called `pi_cloud_instance_id` refers to the Power workspace ID.


    Also, after creating a new workspace it must be targeted by providing its **CRN** before provisioning other resources using IBM Cloud CLI.
    The CRN of a workspace can be copied from the Console (easiest) or retrieved using JSON queries.

    ```sh
    ibm pi ws target $WORKSPACE_CRN
    ```

```terraform title="Network"
--8<-- "includes/tf/ibm_pi_network/hi.tf"
```

1.  

    ```terraform
    --8<-- "includes/tf/ibm_pi_network/full.tf"
    ```

```terraform title="Instance"
--8<-- "includes/tf/ibm_pi_instance/hi.tf"
```

1.  

    ```terraform
    --8<-- "includes/tf/ibm_pi_instance/full.tf"
    ```

!!! note 

    Stock images must be **imported** to the workspace in what looks to be a manual operation.

    ```sh
    ibmcloud pi img cr $IMAGE_ID
    ```

    The resulting images are then visible under the [Boot images section](https://cloud.ibm.com/power/boot-images) of the Console

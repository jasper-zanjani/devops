=== "iam"

    ```sh
    --8<-- "includes/Commands/i/ibmcloud-iam.sh"
    ```


=== "img"

    ```sh
    # List images in a workspace
    ibmcloud pi img ls

    # List images available in the regional image catalog
    ibmcloud pi img lc
    ```

=== "ins"


    ```sh
    # List instances (note that a workspace target must be set)
    ibmcloud pi instance ls

    # Create an instance
    ...
    
    ```

    ```sh title="Virtual machine operations"
    --8<-- "includes/Commands/i/ibmcloud-pi-ins-act.sh"
    ```


=== "vol"

    ```sh
    # List all storage volumes in a workspace
    ibmcloud pi vol ls

    # Create a storage volume
    # Default values:
    #   --storage-pool: General-Flash-8
    #   --storage-tier: tier3
    ibmcloud pi vol cr --size 1

    # Delete a storage volume
    ibmcloud pi vol del $VOLUME_ID
    ```

    ---

    ```sh title="Related"
    # List storage pools for the targeted region
    ibmcloud pi spools

    # List storage tiers for the targeted region
    ibmcloud pi stiers
    ```

=== "ws"

    ```sh
    # List Power Virtual Server workspaces
    ibmcloud pi ws ls

    # Create a workspace
    ibmcloud pi ws cr -d $DATACENTER -p public -g $RG_ID # (1)

    # Extract workspace ID of first displayed workspace
    WORKSPACE_ID=$(ibmcloud pi ws ls --json | jq '.Payload.workspaces.[0].id' -r)

    # Get details of a workspace
    ibmcloud pi ws get $WORKSPACE_ID

    # Target a workspace (requires a Cloud Resource Name (2) )
    ibmcloud pi ws tg $WORKSPACE_CRN

    # Delete a workspace
    ibmcloud pi ws del $WORKSPACE_ID
    ```

    1.  This command requires the ID, not name, of the resource group:

        ```sh
        # Display ID of a named resource group
        ibmcloud resource group $RG --id
        ```

        ```sh title="datacenter"
        # List datacenters
        ibmcloud pi dat ls
        ```

    2.  For some commands, a cloud ID is not accepted but only a [Cloud Resource Name](https://cloud.ibm.com/docs/account?topic=account-crn) (CRN).
        These can be found from within the [Resource List](https://cloud.ibm.com/resources) page of the IBM Cloud console.


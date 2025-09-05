=== "Terminal"

    ```sh
    WORKSPACE_ID=$(ibmcloud pi workspace list | jq '.Payload.workspaces[].id')

    # If a Terraform output has been configured then it can also be used
    WORKSPACE_ID=$(terraform output -raw workspace) # (1)

    # List workspaces
    ibmcloud pi workspace list

    # Accepts only ID, not name
    ibmcloud pi ws get $WORKSPACE_ID
    ```

    1.  

        ```terraform
        --8<-- "includes/tf/ibm/workspace-output.tf"
        ```

    Once provisioned, the workspace must be targeted in order to deploy further resources.
    Note that this command requires not the ID but the CRN, which must be retrieved from the JSON.

    ```sh
    WORKSPACE_CRN=$(ibmcloud pi ws get $WORKSPACE_ID --json | jq '.details.crn')
    ibmcloud pi ws target $WORKSPACE_CRN
    ```

=== ":material-terraform: Terraform"

    ```terraform
    --8<-- "includes/tf/ibm_pi_workspace/hi.tf"
    ```


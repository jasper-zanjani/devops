Some services like Terraform need an API key.

=== "Terminal"

    ```sh title="API keys"
    # Create an API key, saved as the named file in the current working directory
    ibmcloud iam api-key-create $NAME --file $FILENAME --action-if-leaked DELETE

    # List API keys
    ibmcloud iam api-keys
    ```


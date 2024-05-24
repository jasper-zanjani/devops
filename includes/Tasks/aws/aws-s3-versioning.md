**Versioning** is a bucket-level configuration that allows prior edits to files to be made available to administrators.
Versioning cannot be disabled, only suspended.

=== ":material-aws: AWS CLI"

    ```sh
    aws s3api put-bucket-versioning \
        --bucket $BUCKET \
        --versioning-configuration 'Status=Enabled'
    ```

=== ":material-terraform: Terraform"

    ```terraform
    --8<-- "includes/tf/aws-s3-versioning.tf"
    ```
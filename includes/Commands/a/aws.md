=== "iam"

    ```sh
    --8<-- "includes/Commands/a/aws-iam.sh"
    ```

=== "s3"

    ```sh
    --8<-- "includes/Commands/a/aws-s3.sh"
    ```

=== "s3api"

    The [**s3api**](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) subcommand is lower-level than **s3**
    
    ```sh
    --8<-- "includes/Commands/a/aws-s3api.sh"
    ```

    1. 
    ```json title="policy.json"
    --8<-- "includes/configs/policy/aws-s3-public-bucket.json"
    ```


    ACLs are deprecated and no longer enabled by default: bucket policies are preferred.
    Enabling them requires changing the bucket ownership rule.

    ```sh title="Enable ACL"
    --8<-- "includes/Commands/a/aws-s3api-acl.sh"
    ```


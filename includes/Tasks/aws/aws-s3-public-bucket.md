=== ":material-aws:{ .lg .middle } AWS CLI"

    ```sh
    # Create bucket
    aws s3 mb s3://$BUCKET # (1)

    # Confirm
    aws s3 ls # (2)

    # Allow public access by removing the PublicAccessBlock configuration on the bucket
    aws s3api delete-public-access-block \
        --bucket $BUCKET
    
    # Apply a policy
    aws s3api put-bucket-policy --bucket $BUCKET --policy file://policy.json # (3)
    ```

    1. Alternatively, using the [lower-level **s3api**](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html) subcommand.
    ```sh
    # Create bucket
    aws s3api create-bucket --bucket $BUCKET
    ```
    2. 
    ```sh
    # Confirm
    aws s3api list-buckets
    ```
    3. 
    ```json title="policy.json"
    --8<-- "includes/Policy/aws-s3-public-bucket.json"
    ```

    ```sh title="Upload file"
    # Upload $FILE to appear at $ROUTE
    aws s3api put-object \
        --bucket $BUCKET \
        --key $ROUTE \
        --body $FILE
    ```

    ACLs are deprecated and no longer enabled by default: bucket policies are preferred.
    Enabling them requires changing the bucket ownership rule.

    ```sh title="Enable ACL"
    # Enable ACLs by changing the bucket's ownership controls setting
    aws s3api put-bucket-ownership-controls \
        --bucket $BUCKET \
        --ownership-controls 'Rules=[{ObjectOwnership=BucketOwnerPreferred}]'

    # Grant read permission on the ACL
    aws s3api put-object-acl \
        --bucket $BUCKET \
        --key $ROUTE \
        --grant-read uri='http://acs.amazonaws.com/groups/global/AllUsers'

    # Confirm
    aws s3api get-object-acl \
        --bucket $BUCKET \
        --key $ROUTE # (3)
    ```



=== ":material-terraform: Terraform"

    ```terraform
    --8<-- "includes/tf/aws-s3-public-bucket.tf"
    ```
=== ":material-aws: AWS CLI"

    ```sh
    # Sync contents of $PATH with a specified bucket. The s3:// URI can take the ARN or the bucket name and path.
    aws s3 sync $PATH s3://$BUCKET

    # Allow public access
    aws s3api delete-public-access-block --bucket $BUCKET

    aws s3 website --index-document index.html --error-document error.html s3://$BUCKET
    ```

    ```json title="Static website policy document"
    --8<-- "includes/Tasks/aws/s3-static-site-bucket-policy.json"
    ```

    >
    > Note that there appears to be a step missing in these directions.
    > Navigating to a nonexistent file fails to produce the error page, but rather produces a 403 error.
    >
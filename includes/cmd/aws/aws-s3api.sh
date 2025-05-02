# Create bucket
aws s3api create-bucket --bucket $BUCKET

# Confirm
aws s3api list-buckets

# Allow public access by removing the PublicAccessBlock configuration on the bucket
aws s3api delete-public-access-block \
    --bucket $BUCKET

# Apply a policy
aws s3api put-bucket-policy --bucket $BUCKET --policy file://policy.json # (1)

# Upload file to appear at specified route
aws s3api put-object --bucket $BUCKET --key $ROUTE --body $FILE

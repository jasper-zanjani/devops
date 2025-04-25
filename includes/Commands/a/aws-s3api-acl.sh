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
aws s3api get-object-acl --bucket $BUCKET --key $ROUTE

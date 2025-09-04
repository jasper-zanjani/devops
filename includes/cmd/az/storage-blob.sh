# Upload blob
az storage blob upload \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $CONTAINER_NAME \
    --file $FILE_PATH

# Display storage endpoint of blob
az storage blob url \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $CONTAINER_NAME \
    --name $BLOB_NAME

# Download blob
az storage blob download \
    --account-name $STORAGE_ACCOUNT_NAME
    --container-name $CONTAINER_NAME
    --name $BLOB_NAME
    --file $FILE_PATH

# Display blobs
az storage blob list \
    --account-name $STORAGE_ACCOUNT_NAME \
    --container-name $STORAGE_CONTAINER_NAME

# Generate SAS token
az storage blob generate-sas \
    --account-name $STORAGE_ACCT_NAME --account-key $STORAGE_ACCT_KEY \
    --container-name $CONTAINER_NAME --name $BLOB_NAME \
    --permissions r --expiry $EXPIRY_DATE


# Create an API key, saved to the current working directory
ibmcloud iam api-key-create $NAME --file $FILENAME --action-if-leaked DELETE

# List API keys
ibmcloud iam api-keys

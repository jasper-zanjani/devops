# Upload a public SSH key visible to the entire account
ibmcloud pi ssh-key create $KEY_NAME -k $PUBKEY -v account

# SSH key resources are referred to by name, not ID
ibmcloud pi ssh-key -h # create, delete, get, list

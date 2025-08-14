# List Power Virtual Server workspaces
ibmcloud pi ws ls

# Create a workspace
ibmcloud pi ws cr -d $DATACENTER -p public -g $RG_ID

# Extract workspace ID of first displayed workspace
WORKSPACE_ID=$(ibmcloud pi ws ls --json | jq '.Payload.workspaces.[0].id' -r)

# If a Terraform output has been configured then it can also be used
WORKSPACE_ID=$(terraform output -raw workspace)

# Get details of a workspace
ibmcloud pi ws get $WORKSPACE_ID

WORKSPACE_CRN=$(ibmcloud pi ws get $WORKSPACE_ID --json | jq '.details.crn')

# Target a workspace (requires a Cloud Resource Name  )
ibmcloud pi ws target $WORKSPACE_CRN

# Delete a workspace
ibmcloud pi ws del $WORKSPACE_ID

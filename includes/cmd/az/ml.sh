# Manage Azure ML compute resources
az ml compute

# Show details for a compute target
az ml compute show -g $GROUP -n $NAME \
    --workspace-name $WORKSPACE_NAME

# Manage Azure ML workspaces
az ml workspace

# Display specified workspace (the various components of a workspace are specified at the keys:
# - application_insights
# - container_registry
# - key_vault
# - storage_account
az ml workspace show -g $GROUP -n $WORKSPACE_NAME


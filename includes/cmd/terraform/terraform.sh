# Download modules specified in provider block
terraform init

# Validate configuration
terraform validate

# Dry-run
terraform plan

# Create resources
terraform apply

# Skip approval prompt with auto-approve
terraform apply -auto-approve

# Remove resources
terraform destroy

# Display values of output blocks in module
terraform output -raw $BLOCK

# Import an existing resource so that a module acts to update it, rather than attempt to create it
terraform import ibm_pi_volume.volume $WORKSPACE_ID/$VOLUME_ID

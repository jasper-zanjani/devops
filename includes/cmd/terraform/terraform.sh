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

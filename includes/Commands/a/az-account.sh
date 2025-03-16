# Get details for default subscription
az account show

# List subscriptions for the logged-in account
az account list --output table

# Set specific subscription as default
az account set --subscription $SUBSCRIPTION

# Display available locations
az account list-locations

# Logout
az account clear



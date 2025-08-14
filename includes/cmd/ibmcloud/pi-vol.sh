# List all storage volumes in a workspace
ibmcloud pi vol ls

# Create a storage volume
# Default values:
#   --storage-pool: General-Flash-8
#   --storage-tier: tier3
ibmcloud pi vol cr --size 1

# Delete a storage volume
ibmcloud pi vol del $VOLUME_ID

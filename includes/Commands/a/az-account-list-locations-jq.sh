# List locations in the US
az account list-locations \
| jq '.[] | select( .metadata.geographyGroup == "US")'

# Display the named location
az account list-locations \
| jq '.[] | select ( .name == "eastus" )'

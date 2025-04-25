# List locations in the US
az account list-locations --query '[?metadata.geographyGroup==`US`]'

# Display the named location
az account list-locations --query '[?name==`eastus`]'

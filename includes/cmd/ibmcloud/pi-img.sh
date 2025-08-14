# List images in a workspace
ibmcloud pi img ls

# List images available in the regional image catalog
ibmcloud pi img lc

# Find available AIX images
QUERY='.images[] 
| select(.specifications.operatingSystem=="aix")'
ibmcloud pi image list-catalog --json | jq "$QUERY"

# Simplify output
QUERY='images[]
| select(.specifications.operatingSystem=="aix")
| { name: .name, image: .imageID }'
ibmcloud pi image list-catalog --json | jq $QUERY

# Assign a role at the organization level
gcloud organizations add-iam-policy-binding 
    $ORG_ID
    --member="user:$EMAIL"
    --role="roles/compute.xpnAdmin"

# Assign a role at the folder level
gcloud beta resource-manager-folders add-iam-policy-binding 
    $FOLDER_ID
    --member="user:$EMAIL"
    --role="roles/compute.xpnAdmin"

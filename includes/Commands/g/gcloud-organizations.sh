# Assign a role at the organization level
gcloud organizations add-iam-policy-binding 
    $ORG_ID
    --member="user:$EMAIL"
    --role="roles/compute.xpnAdmin"


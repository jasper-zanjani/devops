# Configure defaults for
az devops configure --defaults organization=$ORG project=$PROJECT

# Display users
az devops user list --organization $ORG

# Display a single user
az devops user show --organization $ORG --user $USER

az devops wiki list

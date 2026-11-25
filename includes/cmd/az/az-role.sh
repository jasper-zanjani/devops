# Read assignment
az role definition list -n "Virtual Machine Contributor"

# Assign role
az role assignment create 
    --assignee "rbacuser@example.com" 
    --role "Virtual Machine Contributor" 
    --resource-group ExamRefRG

az role assignment create 
    --assignee "rbacuser@example.com" 
    --role "Owner" 
    --subscription $subId

# List custom roles available for assignment
az role definition list --custom-role-only -o table

# Remove RBAC assignments from a user
az role assignment delete --assignee $u --resource-group $rg --role "Virtual Machine Contributor" 

# Remove RBAC assignment from an Entra group
g=$(az ad group list --query "[?displayName=='Cloud Admins'].objectId" -o tsv)
az role assignment delete --role "Virtual Machine Contributor" -–assignee-object-id $g --resource-group $rg

# View all role assignments in a subscription
az role assignment list --all

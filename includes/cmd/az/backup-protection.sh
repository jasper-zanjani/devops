# Define new backup protection policy
# GRS by default
az backup protection enable-for-vm -g $RG_NAME --vault-name $VAULT_NAME --vm $VM_NAME --policy-name $POLICY_NAME

# Initiate VM backup
az backup protection backup-now -g $RG_NAME -n $VAULT_NAME --container-name $CONT_NAME
    --item-name myVM --retain-until 18-10-2017 --backup-management-type AzureIaasVM

# Enumerate available values for --command-id
az vm run-command list

az vm run-command invoke -g $RG_NAME -n $VM_NAME
    --command-id RunPowerShellScript 
    --scripts @script.ps1 
    --parameters 'arg1=somefoo' 'arg2=somebar'

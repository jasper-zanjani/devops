az policy definition create 
    --name 'allowedVMs' 
    --description 'Only allow virtual machines in the defined SKUs' 
    --mode ALL --rules '{...}' 
    --params '{...}'

az policy assignment create 
    --policy 'allowedVMs' 
    --name 'deny-non-compliant-vms' 
    --scope '/subscriptions/<Subscription ID>' -p

az policy assignment delete --name 'deny-non-compliant-vms'

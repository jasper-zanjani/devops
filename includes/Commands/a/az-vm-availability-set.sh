# Create availability set
az vm availability-set create -n $NAME -g $RG_NAME \
    --platform-fault-domain-count 3 --platform-update-domain-count 10

az network bastion create -g $GROUP -n $NAME -l $REGION \
    --vnet-name $VNET \
    --public-ip-address $PUBLIC_IP_NAME

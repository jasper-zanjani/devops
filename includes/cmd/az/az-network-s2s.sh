LOCAL_GATEWAY_IP="53.50.123.195"
SHARED_KEY="abc123"

az network local-gateway create \
    -n $LOCAL_GATEWAY_NAME -g $RG
    --local-address-prefixes "10.5.0.0/16"
    --gateway-ip-address $LOCAL_GATEWAY_IP 

az network vpn-connection create 
    --name $VPN_CONNECTION_NAME -g $RG -l $LOCATION \
    --vnet-gateway1 VPNGW1 
    --local-gateway2 LocalNetGW
    --shared-key $SHARED_KEY 
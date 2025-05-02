# Create public load balancer
az network public-ip create \
    -n $IP_NAME -g $RG_NAME -l $LOCATION \
    --allocation-method Static
az network lb create \
    -n $LB_NAME -g $RG_NAME -l $LOCATION \
    --backend-pool-name $BACKEND_NAME --frontend-ip-name $FRONTEND_NAME --public-ip-address $IP_NAME
az network lb probe create \
    -g $RG_NAME -n $HEALTH_PROBE_NAME --lb-name $LB_NAME \
    --protocol http --port 80 --path / --interval 5 --threshold 
az network lb rule create 
    --name $LB_RULE_NAME --lb-name $LB_NAME -g $RG_NAME 
    --protocol tcp  
    --backend-port 80 --backend-pool-name backend \
    --frontend-port 80 --frontend-ip-name ExamRefFrontEnd  \
    --probe-name $HEALTH_PROBE_NAME

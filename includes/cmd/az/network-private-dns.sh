# List Private DNS zones
az network private-dns zone list

# Display specified zone
az network private-dns zone show \
  -g $RG_NAME -n $ZONE_NAME

# List zone's record-sets
az network private-dns record-set a list \
  -g $RG_NAME -z $ZONE_NAME

# Display specified record-set
az network private-dns record-set a show \
  -g $RG_NAME -z $ZONE_NAME -n $RECORDSET_NAME

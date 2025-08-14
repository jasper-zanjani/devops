# List instances (note that a workspace target must be set)
ibmcloud pi instance list

# Create an instance
ibmcloud pi instance create $NAME \
    --sys-type s922 \
    --processor-type shared \
    --processors 0.25 \
    --memory 2 \
    --subnets $SNET_ID \
    --image $IMAGE_ID \
    --key-name $KEY_NAME

# List marketplace images
az vm image list --all

# List RHEL images
az vm image list -f rhel

# Retrieve sizes available in specified region
az vm list-sizes -l $LOCATION

# Display status of VMs
az vm list -g $RG_NAME -o table

# Deploy VM from image
az vm create -g $RG_NAME -n $VM_NAME -l $LOCATION \
    --image $IMAGE_NAME

# Deploy VM, specifying legacy unmanaged image
az vm create -g $RG_NAME -n $VM_NAME -l $LOCATION \
    --image $OS_DISK_URI --generate-ssh-keys

# Deploy Windows Server Core image
IMAGE_NAME="MicrosoftWindowsServer:WindowsServer:2016-Datacenter-Server-Core:2016.127.20190603" 
az vm create -g $RG_NAME  -n $VM_NAME -l $LOCATION 
    --image $IMAGE_NAME --nics $NIC_NAME
    --admin-username $USERNAME --admin-password $PASSWORD

# Create managed VM
az vm deallocate -g $RG_NAME --name $VM_NAME
az vm generalize -g $RG_NAME --name $VM_NAME
az image create -g $RG_NAME --name $IMAGE_NAME --source $VM_NAME 

# Add new disk to VM
az vm disk attach -g $RG_NAME -n $DISK_NAME \
    --vm-name $VM_NAME  --new --size-gb 128 --sku Premium_LRS

# Modify host cache setting
az vm disk attach -g $RG_NAME \
    --vm-name $VM_NAME --new --size-gb 128 --disk $DISK_NAME --caching ReadWrite
az vm unmanaged-disk attach

# Resize VM
az vm list-vm-resize-options -g $RG_NAME -n $VM_NAME 
az vm resize -g $RG_NAME -n $VM_NAME --size Standard_DS3_v2

# Create scale set"
az vmss create -g $RG_NAME -n $n 
    --image UbuntuLTS --authentication-type password 
    --admin-username $USERNAME --admin-password $PASSWORD

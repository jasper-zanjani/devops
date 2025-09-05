#### Windows VM

=== ":material-terraform: Terraform"

    ```terraform
    --8<-- "includes/tf/azurerm_windows_virtual_machine/00/main.tf"
    ```

=== "Terminal"


#### Linux VM

=== "Terminal"

    ```sh
    az vm create \
        --resource-group $RESOURCE_GROUP \
        --name $VM_NAME \
        --image $IMAGE_NAME \
        --generate-ssh-keys


    # Resize VM
    az vm list-vm-resize-options 
        -g $g -n $n 

    az vm resize -g $g -n $n 
        --size Standard_DS3_v2

    # Create container registry
    az acr create -g $g -n $n
        --sku Basic --admin-enabled true

    # Add NIC
    az network nic create -g $g -n $n 
        --vnet-name $ExamRefVNET 
        --subnet $subnetName

    az vm nic add -g $g --vm-name $vmName --nics $nicName --primary-nic
    ```

    ```sh
    az vm redeploy -g $g -n $n
    ```

    ```sh
    # Create managed VM
    az vm deallocate -g $g --name $vmName
    az vm generalize -g $g --name $vmName
    az image create -g $g --name $imageName --source $vmName 

    # Add a new disk to a VM
    az vm disk attach -g ExamRefRG --vm-name ExamRefVM --name myDataDisk --new --size-gb 128 --sku Premium_LRS

    # Modify host cache setting
    az vm disk attach --vm-name $VM_NAME -g $RG_NAME \
        --size-gb 128 --disk $DISK_NAME --caching ReadWrite --new
    az vm unmanaged-disk attach
    ```





    ```sh
    # Create a virtual network
    vnetName="ExamRefVNET"
    vnetAddressPrefix="10.0.0.0/16"
    az network vnet create --resource-group $g -n ExamRefVNET --address-prefixes $vnetAddressPrefix -l $location
    dnsRecord="examrefdns123123"
    ipName="ExamRefIP"
    az network public-ip create -n $ipName -g $g --allocation-method Dynamic --dns-name $dnsRecord -l $location
    nsgName="webnsg"
    az network nsg create -n $nsgName -g $g -l $location
    ```


    ```sh
    # Create a NSG rules to allow inbound SSH and HTTP
    az network nsg rule create -n SSH --nsg-name ... --priority 100 -g ... --access Allow --description "SSH Access" --direction Inbound --protocol Tcp --destination-address-prefix "*" --destination-port-range 22 --source-address-prefix "*" --source-port-range "*"
    az network nsg rule create -n HTTP --nsg-name ... --priority 101 -g ... --access Allow --description "Web Access" --direction Inbound --protocol Tcp --destination-address-prefix "*" --destination-port-range 80 --source-address-prefix "*" --source-port-range "* 
    ```

    ```sh
    # Create a network interface
    nicname="WebVMNic1"
    az network nic create -n $nicname -g $g --subnet $Subnet1Name --network-security-group $nsgName --vnet-name $vnetName --public-ip-address $ipName -l $location
    ```

    ```sh
    # Retrieve a list of marketplace images
    az vm image list --all

    # Retrieve form factors available in each region
    az vm list-sizes --location ...
    ```

    ```sh
    # Create the VM
    imageName="Canonical:UbuntuServer:16.04-LTS:latest"
    vmSize="Standard_DS1_V2"
    user=demouser
    vmName="WebVM"
    az vm create -n $vmName -g $g -l $location --size $vmSize --nics $nicname --image $imageName --generate-ssh-keys
    ```


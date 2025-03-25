# Remove network rule
$subnet = Get-AzVirtualNetwork -ResourceGroupName $ng -Name $nn | 
    Get-AzVirtualNetworkSubnetConfig -Name "mysubnet"

Remove-AzStorageAccountNetworkRule -ResourceGroupName $sg -Name $sn -VirtualNetworkResourceId $subnet.Id

# Add network rule for VNet and subnet
$subnet = Get-AzVirtualNetwork -ResourceGroupName $ng -Name $nn | Get-AzVirtualNetworkSubnetConfig -Name "mysubnet"
Add-AzStorageAccountNetworkRule -ResourceGroupName $sg -Name $sn -VirtualNetworkResourceId $subnet.Id

# Enable service endpoint for Azure Storage on an existing virtual network and subnet.
Get-AzVirtualNetwork -ResourceGroupName $rgName -Name $n | Set-AzVirtualNetworkSubnetConfig -Name "mysubnet" -AddressPrefix "10.0.0.0/24" -ServiceEndpoint "Microsoft.Storage" |   Set-AzVirtualNetwork

# Display virtual network rules
Get-AzStorageAccountNetworkRuleSet -ResourceGroupName $rgName -AccountName $n | Select-Object VirtualNetworkRules

# Ensure App Services, backup vault, and event hub have access to a storage account
Get-AzVirtualNetwork -ResourceGroupName RG01 -Name VNET01 |
    Set-AzVirtualNetworkSubnetConfig -Name VSUBNET01 -AddressPrefix 10.0.0.0/24 -ServiceEndpoint Microsoft.Storage |
    Set-AzVirtualNetwork

$subnet = Get-AzVirtualNetwork -ResourceGroupName RG01 -Name VNET01 |
Get-AzVirtualNetworkSubnetConfig -Name VSUBNET01
Add-AzStorageAccountNetworkRule -ResourceGroupName VNET01 -Name Storage01 -VirtualNetworkResourceId $subnet.Id
Update-AzStorageAccountNetworkRuleSet -ResourceGroupName RG01 -Name STORAGE01 -Bypass Azure.Services

# Create storage container
$storageKey = Get-AzStorageAccountKey -Name $storageAccount -ResourceGroupName $resourceGroup
$context = New-AzStorageContext -StorageAccountName $storageAccount -StorageAccountKey $storageKey.Value[0]
Set-AzCurrentStorageAccount -Context $context

New-AzStorageContainer -Name $container -Permission Off

# Upload file as blob to new container
Set-AzStorageBlobContent -File $localFile -Container $container -Blob $blobName

# Create SAS token
$storageKey = Get-AzStorageAccountKey -ResourceGroupName $g -Name $accountName
$context = New-AzStorageContext -StorageAccountName $accountName -StorageAccountKey $storageKey[0].Value
$startTime = Get-Date
$endTime = $startTime.AddHours(4)

New-AzStorageBlobSASToken -Container $container -Blob $blob -Permission "rwd" -StartTime $startTime -ExpiryTime $startTime.AddHours(4) -Context $context
# Bypass network rules to allow access for Azure services like Event Hub and Recovery Services Vault
# Display exceptions for the storage account network rules
Get-AzStorageAccountNetworkRuleSet -ResourceGroupName $g -Name $n | Select-Object Bypass
# Configure exceptions to storage account network rules
Update-AzStorageAccountNetworkRuleSet -ResourceGroupName $g -Name $n -Bypass AzureServices,Metrics,Logging

# List containers
$v = Get-AzRecoveryServicesVault -ResourceGroupName $rg -Name vault
# BackupManagementType accepts the following values: AzureVM, MARS, AzureWorkload, or AzureStorage
# ContainerType accepts AzureVM, Windows, AzureSQL, AzureStorage, or AzureVMAppContainer
Get-AzRecoveryServicesBackupContainer -ContainerType Windows -BackupManagementType MARS -VaultId $v.ID

# Initiate VM backup
$backupcontainer = Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" -FriendlyName "myVM"
$item = Get-AzRecoveryServicesBackupItem -Container $backupcontainer -WorkloadType "AzureVM"
Backup-AzRecoveryServicesBackupItem -Item $item

# Configure VM backup
$policy = Get-AzRecoveryServicesBackupProtectionPolicy -Name "DefaultPolicy"
Enable-AzRecoveryServicesBackupProtection -ResourceGroupName $g -Name $n -Policy $policy

# Define new backup protection policy
$SchPol = Get-AzRecoveryServicesBackupSchedulePolicyObject -WorkloadType "AzureVM" 
$SchPol.ScheduleRunTimes.Clear()
$Dt = Get-Date
$SchPol.ScheduleRunTimes.Add($Dt.ToUniversalTime())
$RetPol = Get-AzRecoveryServicesBackupRetentionPolicyObject -WorkloadType "AzureVM" 
$RetPol.DailySchedule.DurationCountInDays = 365
New-AzRecoveryServicesBackupProtectionPolicy -Name "NewPolicy" -WorkloadType AzureVM -RetentionPolicy $RetPol -SchedulePolicy $SchPol

# Create a virtual network
$subnets = @()
$subnets += New-AzVirtualNetworkSubnetConfig -Name $subnet1Name -AddressPrefix $subnet1AddressPrefix
$subnets += New-AzVirtualNetworkSubnetConfig -Name $subnet2Name -AddressPrefix $subnet2AddressPrefix
$vnet = New-AzVirtualNetwork -Name $vnetName -Location $location -AddressPrefix $vnetAddressSpace -Subnet $subnets
$pip = New-AzPublicIpAddress -Name $ipName -ResourceGroupName $g -Location $location -AllocationMethod Dynamic -DomainNameLabel $dnsName
$nsgRules = @()
$nsgRules += New-AzNetworkSecurityRuleConfig -Name "RDP" -Description "RemoteDesktop" -Protocol Tcp -SourcePortRange "*" -DestinationPortRange "3389" -SourceAddressPrefix "*" -DestinationAddressPrefix "*" -Access Allow -Priority 110 -Direction Inbound
$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name "ExamREfNSG" -SecurityRules $nsgRules -Location $location
$nic = New-AzNetworkInterface -Name $nicNAme -ResourceGroupName $resourceGroupName -Location $location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id
Add-AzVMNetworkInterface -VM $vm -NetworkInterface $nic
$vm = New-AzVMConfig -VMName $vmName -VMSize $vmSize
Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $cred -ProvisionVMAgent -VM $vm
Set-AzVMSourceImage -PublisherName $pubName -Offer $offerName -Skus $skuName -Version "latest" -VM $vm
Set-AzVMOSDisk -CreateOption fromImage -VM $vm
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vm

# Create VMSS
$subnets = @()
$subnet1Name = "Subnet1"
$subnet2Name = "Subnet2"
$subnet1AddressPrefix = "10.0.0.0/24"
$subnet2AddressPrefix = "10.0.1.0/24"
$vnetAddressSpace = "10.0.0.0/16"
$vnetName = "ExamRefVNET"

New-AzResourceGroup -Name $resourceGroupName -Location $location
# Publish a packaged DSC script to a storage account
$g = "ExamRefRG"
$location =- "WestUS"
$vmName = "ExamRefVM"
$storageName = "dscstorageer1"
$configurationName = "Main"
$archiveBlob = "ContosoWeb.ps1.zip"
$configurationPath = ".\ContosoWeb.ps1"

Publish-AzVMDscConfiguration -ConfigurationPath $configurationPath -ResourceGroupName $g -StorageAccountName $storageName
Set-AzVmDscExtension -Version 2.76 -ResourceGroupName $g -VMName $vmName -ArchiveStorageAccountNAme $storageName -ArchiveBlobName $archiveBNlob -AutoUpdate:$false -ConfigurationName $configurationName

# Package a DSC script into a zip file
Publish-AzVMDscConfiguration -ConfigurationPath .\ContosoWeb.ps1 -OutputArchivePath .\ContosoWeb.zip

# Move a resource to another resource group or subscription 
$resourceID = Get-AzResource -ResourceGroupName ExamRefRG | Format-Table -Property ResourceId

Move-AzResource -DestinationResourceGroupName ExamRefDestRG -ResourceId $resourceID
Move-AzResource -DestinationSubscriptionId $subscriptionID -DestinationResourceGroupName ExamRefDestRG -ResourceId $resourceID

# Create from existing resource group
Export-AzResourceGroup -ResourceGroupName ExamRefRG

# Export a resource group to an ARM template
Save-AzResourceGroupDeploymentTemplate -ResourceGroupName ExamRefRG -DeploymentName simpleVMDeployment

# Pass a template file during deployment
New-AzResourceGroupDeployment -Name MyDeployment -ResourceGroupName ExamRefRG -TemplateFile C:\MyTemplates\AppTemplate.json

# Deploy a named ARM template
New-AzResourceGroupDeployment -Mode Complete -Name simpleVMDeployment -ResourceGroupName ExamRefRG

# Enable diagnostics using a storage account specified in a XML configuration file
Set-AzVMDiagnosticsExtension -ResourceGroupName "ResourceGroup01" -VMName "VirtualMachine02" -DiagnosticsConfigurationPath "diagnostics_publicconfig.xml"

# Providing storage account name absent in config, or overriding it if present
Set-AzVMDiagnosticsExtension -ResourceGroupName "ResourceGroup1" -VMName "VirtualMachine2" -DiagnosticsConfigurationPath diagnostics_publicconfig.xml -StorageAccountName "MyStorageAccount"

# Explicitly providing storage account name and key
Set-AzVMDiagnosticsExtension -ResourceGroupName "ResourceGroup01" -VMName "VirtualMachine02" -DiagnosticsConfigurationPath "diagnostics_publicconfig.xml" -StorageAccountName "MyStorageAccount" -StorageAccountKey $storage_key

# Add a new disk to a VM
$dataDiskName = "MyDataDisk"
$location="WestUS"
$diskConfig = New-AzDiskConfig -SkuName Premium_LRS -Location $location -CreateOption Empty -DiskSizeGB 128
$dataDisk1 = New-AzDisk -DiskName $dataDiskName -Disk $diskConfig -ResourceGroupNAme ExamRefRG
$vm = Get-AzVM -Name ExamRefVM -ResourceGroupName ExamRefRG
$vm = Add-AzVMDataDisk -VM $vm -Name $dataDiskName -CreateOption Attach -ManagedDiskId $dataDisk1.Id -Lun 1
Update-AzVM -VM $vm -ResourceGroupName ExamRefRG

# Modify host cache setting
$vm = Get-AzVM -ResourceGroupName $g -Name $vmName
Set-AzVMDataDisk -VM $vm -Lun 0 -Caching ReadOnly
Update-AzVM -ResourceGroupName $g -VM $vm

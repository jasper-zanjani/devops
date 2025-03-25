1. Register a server to the sync group by installing **Azure File Sync agent** on each server. When installing, you sign in with your subscription's credentials, then register the server by providing the Subscription, Resource Group, and Storage Sync Service names.
2. Click **Add Server Endpoint**. This will display a dropdown of all servers with the agent installed and associated with the sync service.

```sh title="Upload blob"
az storage blob upload --container-name $containerName --account-name $accountName --account-key $accountKey --file $file --name $blobName
    
AzCopy copy localFilePath https://storageAccount.blob.core.windows.net/destinationContainer/path/to/blob?SASToken
```
    
```cmd
:: Download a blob from a container
AzCopy copy https://storageAccount.blob.core.windows.net/sourceContainer/path/to/blob?SASToken localFilePath

:: Copy a blob from one container to another
AzCopy /Source:https://sourceblob.blob.core.windows.net/sourcecontainer/ 
    /Dest:https://deststorage.blob.core.windows.net/destcontainer/ 
    /SourceKey:sourcekey /DestKey:destkey /Pattern:disk1.vhd
```
    

```powershell
$blobCopyState = Start-AzStorageBlobCopy -SrcBlob $blobName -SrcContainer $srcContainer -Context $srcContext -DestContainer $destContainer -DestBlob $vhdName -DestContext $destContext
$srcStorageKey = Get-AzStorageAccountKey -ResourceGroupName $sourceg -Name $srcStorageAccount
$destStorageKey = Get-AzStorageAccountKey -ResourceGroupName $destg -Name $destStorageAccount
$srcContext = New-AzStorageContext -StorageAccountName $srcStorageAccount -StorageAccountKey $srcStorageKey.Value[0]
$destContext = New-AzStorageContext -StorageAccountNAme $destStorageAccount -StorageAccountKey $destStorageKey.Value[0]

# Create new container in destination account
New-AzStorageContainer -Name $destContainer -Context $destContext

# Make the copy
$copiedBlob = Start-AzStorageBlobCopy -SrcBlob $blobName -SrcContainer $srcContainer -Context $srcContext -DestContainer $destContainer -DestBlob $blobName -DestContext $destContext
```
```sh
az storage blob copy start --account-name $destStorageAccount --account-key $destStorageKey --destination-blob $blobName --source-account-name $srcStorageAccount --source-container $srcContainer --source-blob $blobName --source-account-key $srcStorageKey
```

### Monitor progress of the async blob copy
```powershell
$copiedBlob | Get-AzStorageBlobCopyState
```
```sh
az storage blob show --account-name $destStorageAccount --account-key $destStorageKey --container-name $destContainer --name $blobName
```


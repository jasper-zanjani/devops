# Azure Backup

??? hint "Azure CLI"

    --8<-- "includes/cmd/az/info.md"

```sh
# Create Recovery Services Vault
az backup vault create --name $NAME --resource-group $RG --Location $L
```
    
Enable MFA


Recover files

=== "Azure Portal"

    ![](/img/az-vm-backup.png)
    ![](/img/az-vm-backup-recovery.png)
    ![](/img/file-recovery-blade.png)

    Download the executable (for Windows VMs) or PowerShell script (for Linux VMs). A Python script is generated when downloading to a Linux machine.

### Configure Backup reports

- [Configure Azure Backup reports](https://docs.microsoft.com/en-us/azure/backup/configure-reports)

A Log Analytics workspace must exist in the same region as the Recovery Services vault.

1. Turn on [diagnostics](Monitoring#logs) in the Recovery Services vault
2. Select Archive to a storage account (**NOT** Send to Log Analytics), providing a storage account to store information needed for report.
3. Select `AzureBackupReport` under log section, which will collect all needed data models and information for the backup report.
4. Connect to Azure Backup in PowerBI using a service content pack.

![](/img/az-backup-report.png)

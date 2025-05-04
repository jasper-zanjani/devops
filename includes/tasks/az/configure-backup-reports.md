- [Configure Azure Backup reports](https://docs.microsoft.com/en-us/azure/backup/configure-reports)

A Log Analytics workspace must exist.

1. Turn on [diagnostics](Monitoring#logs) in the Recovery Services vault
2. Select Archive to a storage account (**NOT** Send to Log Analytics), providing a storage account to store information needed for report.
3. Select `AzureBackupReport` under log section, which will collect all needed data models and information for the backup report.
4. Connect to Azure Backup in PowerBI using a service content pack.

![](/img/az-backup-report.png)

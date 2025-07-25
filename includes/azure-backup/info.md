Azure Backup (1) 
{: .annotate }

1.  

    --8<-- "includes/azure-backup/callout.md"

Azure Backup can backup servers and VMs in the cloud or on-prem and virtualized workloads like SQL Server and Sharepoint. 
Some services like Azure SQL databases are already backed up automatically.

Storage accounts can be backed up, but **not** blob storage. 
Blob storage is already replicated locally, which provides fault-tolerance. Instead, you can use snapshots.

--8<-- "includes/azure-backup/jobs.md"

#### Agents

--8<-- "includes/azure-backup/agents.md"

#### Reports

Log Analytics workspaces must be located in the same region as the Recovery Services vault in order to store Backup reports.

## Pre-Checks

Azure Backup [pre-checks](https://azure.microsoft.com/en-us/blog/azure-vm-backup-pre-checks/) complete with various statuses that indicate potential problems

- **Passed**: VM configuration is conducive for successful backups
- **Warning**: Issues that **might** lead to backup failures
- **Critical**: Issues that **will** lead to backup failures


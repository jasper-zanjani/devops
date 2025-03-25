**Azure Backup** can backup on-prem servers, cloud-based VMs, and virtualized workloads like SQL Server and Sharepoint. 
However Azure SQL databases are already backed up by an automatic service by default. <sup>AZ-103 p. 159</sup>

On-prem machines can be backed up using several [agents](#agents) <sup>AZ-103 p. 162</sup>

- [MARS Agent](#mars-agent)

-   System Center Data Protection Manager (DPM) or **Microsoft Azure Backup Server (MABS)** can be used as backup servers.  
    The backup server can then be backed up to a [Recovery Services vault](#recovery-services-vault)

Azure VMs can be backed up

- Directly using an extension on the [**Azure VM Agent**](#azure-vm-agent), which comes preinstalled on Marketplace images
- Specific files and folders on a VM can be backed up by running the MARS agent
- To the MABS running in Azure, which can then be backed up to a Recovery Services vault

Storage accounts can be backed up, but **not** blob storage. Blob storage is already replicated locally, which provides fault-tolerance. Instead, you can use snapshots.


When installed, the `Get-AzVM` command exposes a `ProvisionVMAgent` property with a boolean value under `OSProfile.WindowsConfiguration`.

- 

## Containers

There appear to be resources that house items to be protected that can be [enumerated](#list-containers).

## Reports
Log Analytics workspaces must be located in the same region as the Recovery Services vault in order to store Backup reports.

## Pre-Checks
Azure Backup [pre-checks](https://azure.microsoft.com/en-us/blog/azure-vm-backup-pre-checks/) complete with various statuses that indicate potential problems

- **Passed**: VM configuration is conducive for successful backups
- **Warning**: Issues that **might** lead to backup failures
- **Critical**: Issues that **will** lead to backup failures

# Tasks

Create Recovery Services Vault

=== "Azure Portal"

    ![](/img/az-rsv-create.jpg)


=== "Azure PowerShell"

    ```powershell
    New-AzRecoveryServicesVault -Name $n -ResourceGroupName $rgName -Location $l
    ```
    
=== "Azure CLI"

    ```sh
    # Create Recovery Services Vault
    az backup vault create --name $n --resource-group $rgName --Location $l
    ```
    
Enable MFA

This requires [MFA](Azure-AD#enable-mfa) to be enabled.

=== "Azure Portal"

    ![](/img/az-rsv-prop.jpg)
    ![](/img/az-rsv-prop-security.jpg)
    
    Enable multi-factor authentication for the Recovery services vault by going to the vault in the Portal, then **Properties** > **Security settings: Update** > Choose **Yes** in the dropdown. An option to generate a security PIN will appear in this same blade.

Recover files

=== "Azure Portal"

    ![](/img/az-vm-backup.png)
    ![](/img/az-vm-backup-recovery.png)
    ![](/img/file-recovery-blade.png)

    Download the executable (for Windows VMs) or PowerShell script (for Linux VMs). A Python script is generated when downloading to a Linux machine.

### Configure Backup reports

- [Configure Azure Backup reports](https://docs.microsoft.com/en-us/azure/backup/configure-reports)

A Log Analytics workspace must exist.

1. Turn on [diagnostics](Monitoring#logs) in the Recovery Services vault
2. Select Archive to a storage account (**NOT** Send to Log Analytics), providing a storage account to store information needed for report.
3. Select `AzureBackupReport` under log section, which will collect all needed data models and information for the backup report.
4. Connect to Azure Backup in PowerBI using a service content pack.

![](/img/az-backup-report.png)

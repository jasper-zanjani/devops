On-prem machines can be backed up using several agents

-   MARS (Microsoft Azure Recovery Services) agent can be deployed in Windows virtual machines in Azure or on-prem.
-   Microsoft DPM (System Center Data Protection Manager), which requires additional licensing, is the backup solution that has traditionally been used for VMs hosted on Hyper-V or VMWare, and it supports Azure Backup.
-   MABS (Microsoft Azure Backup Server) is a modified version of DPM that is tightly integrated with, and included in the cost of, Azure Backup.

Azure VMs are typically backed up directly using an extension on the Azure VM agent which comes preinstalled on marketplace images.

Other methods of backing up on Azure VMs:

-   Specific files and folders on a VM can be backed up by running the MARS agent
-   To the MABS running in Azure, which can then be backed up to a Recovery Services vault

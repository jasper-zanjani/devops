[Azure Machine Configuration](https://learn.microsoft.com/en-us/azure/governance/machine-configuration/overview/01-overview-concepts) is a feature that provides native capability to audit or configure operating system settings as code for machines running in Azure.

The [Azure Machine Configuration extension](https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/guest-configuration?tabs=portal) performs audit and configuration operations inside VMs.
Once it is installed it is visible under Settings > Extensions + applications as "AzurePolicyforLinux".
As a prerequisite for installation, it requires a system-assigned [**managed identity**](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/overview), which can be viewed on the VM's page under Security > Identity.

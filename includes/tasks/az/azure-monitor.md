### Enable diagnostics on a VM

Sources:
- [`az vm diagnostics set`](https://docs.microsoft.com/en-us/cli/azure/vm/diagnostics?view=azure-cli-latest#az_vm_diagnostics_set)

```sh

```
### Diagnostics log collection with a storage account

Browse to the resource itself. Alternatively, open **Azure Monitor** and then the **Diagnostics Settings** blade. From there you can view all eligible resouce types and view status of log collection. 

```sh
resourceId=$(az resource show -resource-group $resourceGroupName -name $resourceName --resource-type $resourceType --query id --output tsv)
az monitor diagnostic-settings create --name $diagnosticName --storage-account $storageId --resource $resouceId --resource-group $resourceGroup \
  --logs '[ {
    "category": <categoryName>,
    "enabled": true,
    "retentionPolicy": {
      "days": <numberOfDays>,
      "enabled": true } } ] '
```

### Diagnostics log streaming to an Event Hub

```sh
resourceId=$(az resource show -resource-group $resourceGroupName -name $resourceName --resource-type $resourceType --query id --output tsv)
az monitor diagnostic-settings create --name $diagnosticName --event-hub $eventHubName --event-hub-rule $eventHubRuleId --resource $resourceId \
  --logs '[{
    "category": <categoryName>,
    "enabled": true }]'
```

### Diagnostics log collection in a Log Analytics workspace

The [PowerShell module](https://docs.microsoft.com/en-us/powershell/module/az.operationalinsights/get-azoperationalinsightsworkspace?view=azps-5.0.0) that allows interaction with Log Analytics still refers to the service's [old name](#operational-insights).

```powershell
$workspace = Get-AzOperationalInsightsWorkspace -Name $logAnalyticsName -ResourceGroupName $g
Set-AzDiagnosticSetting -ResourceId $r.ResourceId -WorkspaceId $workspace.ResourceId -Enabled $true
```

```sh
az monitor diagnostic-settings create 
    --name $DIAGNOSTICNAME \
    --workspace $LOGANALYTICSNAME \
    --resouce-group $RESOURCE_GROUP \
    --resource $RID \
  --logs '[{
    "category": <categoryName>,
    "enabled": true }]'
```

### Create an alert rule

Sources:

- [Create, view, and manage activity log alerts by using Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/alerts-activity-log)

![](/img/manage-action-groups.png)

![](/img/create-new-alert-rule-options.png)

### Create Log Analytics workspace

# Sources
- AZ-103: [<code>1.2</code>](AZ-103#12-analyze-resource-utilization-and-consumption "Analyze resource utilization and consumption")
- AZ-104: [<code>5.1</code>](AZ-104#51-monitor-resources-by-using-azure-monitor "Monitor resources by using Azure Monitor")

- [Azure Monitor for VMs](https://app.pluralsight.com/course-player?clipId=f281d048-7e2a-4312-9200-4665a12fd126)

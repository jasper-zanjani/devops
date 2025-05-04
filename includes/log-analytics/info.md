A Log Analytics workspace (1) is a form of abstracting the process of log collection and is used to collect and aggregate logs. 
Like any other resource, it must be associated with a location and a resource group. 
Any Azure resource can only report logs to a single workspace, but Azure Monitor allows multiple workspaces to be queried simultaneously. 
The logs can be queried through Log Analytics or Monitor. Because a workspace is a resource, RBAC can be applied to control access to it. 
{: .annotate }

1.  

    --8<-- "includes/log-analytics/callout.md"

Log Analytics is based on Azure Data Explorer and uses Kusto.


## Application Insights

Application Insights is a platfrom separate from Log Analytics which is intended to monitor web applications.

## Alerts

### Actions
![](/img/az-action-group.png)

A single action group can trigger multiple actions. Available types include: Email/SMS/Push/Voice, Azure Function, Logic App, Webhook, ITSM, and Automation Runbook

- **IT Service Management Connector** up to 10 ITSM actions can be configured with an ITSM connection
  - Supported providers include ServiceNow, System Center Service Manager, Provance, and Cherwell :point_right: [Connect Azure to ITSM tools using ITSMC](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/itsmc-overview)
- [Webhooks](https://docs.microsoft.com/azure/monitoring-and-diagnos-tics/insights-webhooks-alerts)
- Runbook runs in Azure Automation Service [Runbooks](https://azure.microsoft.com/blog/automatically-remediate-azure-vm-alerts-with-automation-run-books/)

The maximum number of alert notifications per hour:
- Email: 60
- Voice: 12
- SMS: 12

## VMs

![](/img/az-vm-insights.png)

"Virtual Machine **Insights**" (or "Azure Monitor for VMs") is the successor to older monitoring workflow that used "guest OS diagnostics" in conjunction with Metrics Explorer. It requires a [log analytics workspace](#log-analytics).
**Diagnostic settings**, conventionally, was the feature that would be enabled to allow Azure to collect metrics and logs from VMs, including **event logs** and performance counters.


Two primary views:
- **Performance** is a successor to the old Metrics Explorer
- **Map** (originally "Service Map")



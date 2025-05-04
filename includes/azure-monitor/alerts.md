Azure Monitor alerts (1) provide notifications about problems, potentially before users notice them.
{: .annotate }

1.  === "Resources"

    -   [What are Azure Monitor alerts?](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview)

Alerts can be created from the Alerts pane in the Monitor blade:
Most resource blades also have Alerts in the resource menu under Monitoring.

**Alert rules**, which are used to generate alerts, contain
- **Target resource**, any Azure resource that generates signals, defines the scope and signals available for the alert.
- **Signal** (i.e. metric or Activity Log) emitted by target resource. Signals are of 3 types: 
  1. Metrics
  2. Log search queries 
  3. Activity logs
- **Conditional logic** for alert combines the signal and a logical test to trigger alert.
- **Action Group** determines what will happen when the alert is trigged. Action groups are themselves resources, and thus located in a subscription and resource group, and have:
  - **Name**
  - **Short name** is used to identify the Action Group in emails and notifications and is limited to 12 characters
  - [**Actions**](#actions) define the configuration for a specific action type. 
- Severity (0-4)

Alerts can have 3 states:

- **New** and not reviewed
- **Acknowledged** issue is being actioned by an admin
- **Closed** issue that generated the alerts has been resolved and the alert has been marked as closedAlerts have many notification options, including email, SMS, mobile app, voice, and integration with automation. 


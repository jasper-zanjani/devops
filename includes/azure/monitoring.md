A robust monitoring strategy implementing proactive notifications helps to increase uptime and optimize performance. 
Azure offers Azure Monitor and Azure Advisor.

| Feature               | Logs                                                                                    | Metrics                                                                                              |
| :-------------------- | :-------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| **Retention**         | Stored in Log Analytics (2 years)                                                       | Stored in Monitor for 93 days, but metrics can be sent to Log Analytics and Storage accounts as well |
| **Properties**        | Varying properties for each log, with support for rich data types such as date and time | Fixed set of properties (or attributes): time, type, resource, value, and (optionally) dimensions.   |
| **Data availability** | Triggered by an event, requiring time to process before they are available for querying | Gathered at intervals and available for immediate querying.                                          |

Virtual machines can be one of the most expensive resources in a cloud implementation, and there are several ways to reduce their cost

- Deallocate compute when not needed
- Delete unused virtual machines and allocate them only on demand
- Right-size VMs so that you don't overuse resources

Advisor can also identify

- ExpressRoute circuits that have been "Not Provisioned" for more than 30 days
- Gateways that have been idle for more than 90 days

There are two monitoring data streams:

- **Metrics** are the numerical time series data produced by resources and services within Azure. They are collected at 1-minute intervals, identified by a metric name and namespace (category). Metrics can be one-dimensional or have up to 10 dimensions.
    - Metrics have the following properties:
        - **Time** the value was collected
        - **Type** of measurement made
        - **Resource** associated with value
        - **Value**
    - Metrics can be stored in:
        - Azure Monitor for 93 days
        - Log Analytics for 2 years
        - Storage account, where they are treated according to the retention policy and storage limits of the account.
- **Logs** come in various types
  - **Diagnostics logs** (including **resource logs** and **tenant logs**) are a type of log data that can be configured to send data to other locations, such as a Storage account or [Log Analytics workspace](#log-analytics). Diagnostics logs have to be enabled for each resource to be monitored through the Portal by enabling Diagnostics Settings, and not all resource types support diagnostic logs. Of those that do, not all resources support a retention policy or sending metric data.
  - **Azure Activity logs** is a subscription level log that captures events that range from operational data (i.e. resource creation, deletion) to service health events for a subscription, but lacks resource-level detail..
  - **Guest telemetry** can relay logs from VMs with the use of diagnostics agents

## Log Analytics

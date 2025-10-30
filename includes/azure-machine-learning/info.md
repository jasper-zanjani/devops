Azure Machine Learning (1)
{: .annotate }

1.  

    --8<-- "includes/azure-machine-learning/callout.md"

Azure ML [**workspaces**](https://learn.microsoft.com/en-us/azure/machine-learning/concept-workspace) exist within a resource group and associate a storage account, a key vault, Application Insights, and container registry.


Linked services include **datastores** and **compute targets**.

A [**compute target**](https://learn.microsoft.com/en-us/azure/machine-learning/concept-compute-target) is a designated compute resource that runs machine learning training scripts or host a service deployment
Compute targets include:

-   Azure Databricks
-   Data Lake Analytics
-   HDinsight
-   Synapse Spark pool
-   VMs

In Azure ML, compute is managed and is available in two varieties

-   Compute instances
-   Compute clusters

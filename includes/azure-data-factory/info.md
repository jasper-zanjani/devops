Azure Data Factory (1) is Azure's cloud ETL (extract-transform-load) service, built to organize and transform data from disparate database sources and prepare them for analysis in tools like PowerBI.
{: .annotate }

1.  

    --8<-- "includes/azure-data-factory/callout.md"

[Concepts](https://learn.microsoft.com/en-us/azure/data-factory/introduction#top-level-concepts):

-   Pipelines are logical groupings of activities that perform a task.
-   Activities
-   Data flows
-   Datasets represent data structures within data stores.
-   Linked services define connection information needed for Data Factory to connect to external resource (cf. connection strings).
    -   A linked service can represent a data store (i.e. a SQL Server database, file share, Azure blob storage account, etc).
        This corresponds to the copy activity.
    -   It can also represent a compute resource that can host the execution of an activity.
        This represents the transform data activity.

A linked service defines the connection to the data source, and a dataset represents the structure of the data.

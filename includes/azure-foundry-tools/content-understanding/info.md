Content Understanding (1) is one of the Foundry Tools that is available within the AI Foundry resource.
It allows processing and analysis of various modealities of unstructured content such as images, scanned documents, videos, and audio.
{: .annotate }

1.  

    --8<-- "includes/azure-foundry-tools/content-understanding/callout.md"

A Content Understanding project requires and exists within an AI Foundry resource (previously an Azure AI Services Hub), which is only available in [some regions](https://learn.microsoft.com/en-us/azure/ai-services/content-understanding/language-region-support) at this time. 
It additionally requires a storage account with blob storage.

Once content is uploaded to the project, Content Understanding will suggest _scenario templates_ to work with it (Document Analysis).

Within Content Understanding, the _analyzer_ is the core component that defines how content is processed.
It configures content extraction settings, field extraction schema, and model deployments.
These are then applied uniformly to all incoming data.
Prebuilt analyzers are available and custom analyzers can be created.

_Field extraction_ refers to the process of generating key-value pairs from content based on a defined schema.
Fields can be extracted using one of three _methods_:

-   _Extract_: Directly extract values from content
-   _Classify_: Classify content from a predefined set of categories (sentiment, chart type, etc)
-   _Generate_: Freely generate values from content, such as summarizing or describing

Once a schema is defined, the analyzer can be _built_, which means it is saved and it will begin supporting a REST API endpoint to be used by downstream agents.

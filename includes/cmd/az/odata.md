Various Azure CLI commands accept **OData** queries after `--filter`. (1)
The OData expression language is used in various Microsoft services and derive from the Microsoft Graph API.
{: .annotate }

1.  **References**

1.  
    -   [OData language overview for `$filter`, `$orderby`, and `$select` in Azure AI Search](https://learn.microsoft.com/en-us/azure/search/query-odata-filter-orderby-syntax)


```sh
az ad user list --filter $ODATA_QUERY
```




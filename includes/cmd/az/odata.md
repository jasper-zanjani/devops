Various Azure CLI commands accept [OData](https://learn.microsoft.com/en-us/azure/search/query-odata-filter-orderby-syntax) queries after `--filter`.
The OData expression language is used in various Microsoft services and derive from the Microsoft Graph API.

```sh
az ad user list --filter $ODATA_QUERY
```

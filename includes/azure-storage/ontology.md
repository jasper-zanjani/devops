<div class="grid cards" markdown>

```mermaid
--8<-- "includes/azure-storage/diagram.mmd"
```

-   The minimum information needed to create a locally-redundant storage account is a SKU ("Standard\_RAGRS" by default).
The default values for other options are as follows:

    -   `--access-tier` ("Hot")
    -   `--allow-blob-public-access` (false)
    -   `--min-tls-version` ("TLS1\_0")
    -   `--kind` ("StorageV2")

</div>


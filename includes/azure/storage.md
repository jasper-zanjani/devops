A [**storage account**](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview) contains all Azure Storage data objects: blobs, files, queues, and tables.

There are several types of storage accounts:

- **Standard general-purpose v2** is the gold standard supporting all four services
- Premium performance storage accounts use SSDs:
    - **Premium block blobs** support blob storage only
    - **Premium file shares** support Azure file shares only
    - **Premium page blobs** support page blobs only

#### Blob storage

--8<-- "includes/azure-blob-storage/info.md"

#### Standard endpoints

A storage account provides a unique namespace in Azure accessible from a URL address.

#### Private endpoints

A [**private endpoint**](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#dns-configuration) is a network interface that uses a private IP address from your virtual network to provide private and secure access to a service using Private Link.
A private endpoint specifies:

- Name
- Subnet
- Private-link resource (i.e. a storage account)
- Target subresource (i.e. blob, table, queue, file, web, or dfs)
- Connection approval method: automatic or manual

--8<-- "includes/azure/blob-storage.md"

A **storage account** is a unique namespace that can store various containers.
It must have a globally unique name because it appears in the base address used for access (1).
{: .annotate }

1. `https://<storage_account>.blob.core.windows.net/container/blob`

**Blobs** are text or binary data, organized into an unlimited number of **containers**, which provide structure to a storage account similar to folders.
Container names must be between 3 and 63 characters long, composed of numbers, lowercase characters, and dashes.



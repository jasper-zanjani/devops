# Storage

**Blob Storage** allows large volumes of unstructured data to be stored in the cloud.

A **storage account** is a unique namespace that can store various containers.
It must have a globally unique name because it appears in the base address used for access (1).
**Blobs** are text or binary data, organized into an unlimited number of **containers**, which provide structure to a storage account similar to folders.
Container names must be between 3 and 63 characters long, composed of numbers, lowercase characters, and dashes.
{: .annotate }

1. "https://`<storage account>`.blob.core.windows.net"


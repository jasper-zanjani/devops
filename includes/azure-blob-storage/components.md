
-   A storage account is a unique namespace that contains containers and blobs.
    It must have a globally unique name because it appears in the base address used for access (1).
    {: .annotate }

    1.  `https://<storage_account>.blob.core.windows.net/<container>/<blob>`

-   Containers, similar to folders, organize blobs.
    Container names must be between 3 and 63 characters long, composed of numbers, lowercase characters, and dashes.

-   Blobs are text or binary data and come in three varieties: Block blobs, Append blobs, and Page blobs. 

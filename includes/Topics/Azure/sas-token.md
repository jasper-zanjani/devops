A **shared access signature** (SAS) tokens are generated from a storage account key; if the key is invalidated then so are all SAS tokens generated from it. The user delegation SAS token itself is meant to be **appended** to the end of the blob's URI. (1)
{: .annotate }

1. --8<-- "includes/Tasks/az/sas-token.md"



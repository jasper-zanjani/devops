A **shared access signature** (SAS) (1) is a method of authorization for access to storage resources.
{: .annotate }

1.  === "Resources"

        -   [Microsoft Azure - Introduction to SAS](https://www.youtube.com/watch?v=u7Zi2vWZbUc) :material-youtube:

            -   [SAS URI format](https://www.youtube.com/watch?v=u7Zi2vWZbUc&t=657s)

There are three types of SAS:

-   Account-level SAS delegates access to resources in one or more storage services.
-   Service-level SAS delegates access to a single resource within an account
-   User-delegation SAS is a SAS URL signed with Entra ID user credentials and applies to Blob Storage only.

A SAS URI is composed of storage endpoint and the SAS token, a [query string](https://en.wikipedia.org/wiki/Query_string) containing various parameters (1).
{: .annotate }

1.  

    -   se: date in ISO-8601 format (i.e. "2025-05-05T22%3A47Z")
    -   sig: 50 character base64 encoded string
    -   sp: permissions
    -   sr: resource types (i.e. "b" for blob)
    -   sv: version of API? (i.e. "2021-06-08")

```
?se=▓▒░▓-▓▒-▓▒T▓▓%3A░▓Z&sp=r&sr=b&sv=2021-06-08&sig=▓▒▒▒░░▒░░░░░▒▓░░▓▒▒▒▓░▓▓░▓▓▓▒▓▓▓▒▓░░░▓▒░░▓▒▒▓▒░▓▒░
```

SAS tokens are generated from a storage account key; if the key is invalidated then so are all SAS tokens generated from it. 
The user delegation SAS token itself is meant to be **appended** to the end of the blob's URI.




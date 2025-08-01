A view to show database connection strings can be found in the Overview pane of a SQL Database in the Azure Portal.
SQL authentication is the default authentication type in Azure CLI (equivalent to `--auth-type SqlPassword`) and is available in all client connection providers.
Only ADO.NET supports Microsoft Entra passwordless authentication.

```sh
--8<-- "includes/cmd/az/sql-show-connection-string.sh"
```

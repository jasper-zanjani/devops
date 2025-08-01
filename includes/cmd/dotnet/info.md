The .NET CLI (1) is a cross-platform toolchain for developing, building, running, and publishing .NET applications.
{: .annotate }

```sh
dotnet --list-sdks

# Installs to $HOME/.templateengine/packages
dotnet new install microsoft.build.sql.templates

# Create a SQL project, including a SQL Server Data-Tier Application package (.dacpac)
dotnet new sqlproj -n ShippingAdventureWorks --target-platform SqlAzureV12
```

Install the [sqlpackage](https://learn.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver17) binary to $HOME/.dotnet/tools

```sh
dotnet tool install -g microsoft.sqlpackage

sqlpackage /version
```

An additional tool which is very useful for learning is the [Azure Data Explorer Kusto emulator](https://learn.microsoft.com/en-us/azure/data-explorer/kusto-emulator-overview)

```sh
--8<-- "includes/cmd/podman/podman-pull-kustainer.sh"
--8<-- "includes/cmd/podman/podman-run-kustainer.sh"
```

Azure Data Explorer will then be available at the container's port (which will redirect to dataexplorer.azure.com).

A database has to be created first.

```kusto
--8<-- "includes/kusto/tasks/00-create-db.kql"
```

Then a table has to be created.

```kusto
--8<-- "includes/kusto/tasks/00-create-table.kql"
```

A (headerless) csv file can be provided within the container's mount which must be ingested.

```kusto
--8<-- "includes/kusto/tasks/00-ingest-data.kql"
```


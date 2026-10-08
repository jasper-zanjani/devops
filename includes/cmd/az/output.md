Azure CLI outputs to JSON by default, but various options are available to `-o`/`--output`, including `table`.

Additionally an OData (1) argument can be provided to `--query`, which can define the properties and columns shown in the output.
{: .annotate }

1.  

    --8<-- "includes/cmd/az/odata.md"

```sh
az vm list-sizes --query '[].{Name:name, CPUs:numberOfCores}' -o table
```

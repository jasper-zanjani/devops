Azure CLI's **--query** option supports [JMESPath query syntax](https://learn.microsoft.com/en-us/cli/azure/use-azure-cli-successfully-query).
Note that string values must be surrounded by single quotes ++single-quote++ or backticks ++grave++.
Double quotes ++double-quote++ do not work.

```sh
--8<-- "includes/cmd/az/az-account-list-locations-query.sh"
```

Alternatively, the results can be piped to the jq utility, which follows a similar but not identical syntax

```sh
--8<-- "includes/cmd/az/az-account-list-locations-jq.sh"
```


```sh title="Find VM image publishers by name"
--8<-- "includes/cmd/az/az-vm-image-list-publishers.sh"
```

# Displaying information


#### Locations

Azure offers a global infrastructure of [datacenters](https://datacenters.microsoft.com/globe/explore) called **locations**.

These can be queried from the command-line.

```sh
--8<-- "includes/cmd/az/az-account-list-locations.sh"
```

--8<-- "includes/tasks/az/query.md"

#### Subscription ID

```sh title="Get subscription ID"
az account show --query id # (1)
```

1.  

    ``` title="Output"
    "▓▒▒░▓▒▓░-▓░░▓-▒▒░▓-░░▒▒-░░▓▒▓▓▓▒▒▒▒▓"
    ```

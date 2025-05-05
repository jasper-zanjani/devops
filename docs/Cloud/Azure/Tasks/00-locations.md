# Locations

Azure offers a global infrastructure of [datacenters](https://datacenters.microsoft.com/globe/explore) called **locations**.

These can be queried from the command-line.

```sh
--8<-- "includes/cmd/az/az-account-list-locations.sh"
```

<div class="grid cards" markdown>

-   **Query**

    ---

    The JSON document returned also offers a good case study of [JMESPath query syntax](https://learn.microsoft.com/en-us/cli/azure/use-azure-cli-successfully-query).
    Note that string values must be surrounded by single quotes ++single-quote++ or backticks ++grave++.
    Double quotes ++double-quote++ do not work.

    ```sh
    --8<-- "includes/cmd/az/az-account-list-locations-query.sh"
    ```

-   **jq**

    ---

    Alternatively, the results can be piped to the jq utility, which follows a similar but not identical syntax

    ```sh
    --8<-- "includes/cmd/az/az-account-list-locations-jq.sh"
    ```

</div>



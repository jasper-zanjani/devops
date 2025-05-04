Command-line clients for cloud providers often output JSON documents. These can be queried in various ways.

```sh
--8<-- "includes/cmd/az/az-account-list-locations.sh"
```

Google Cloud's CLI utility gcloud will also output JSON:

```sh
gcloud compute regions list --format json
```

<div class="grid cards" markdown>

-   **Query**

    ---

    Azure CLI's `--query` option supports [JMESPath query syntax](https://learn.microsoft.com/en-us/cli/azure/use-azure-cli-successfully-query).
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


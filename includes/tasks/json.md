Command-line clients for cloud providers often output JSON documents. These can be queried in various ways.

<div class="grid cards" markdown>

```sh title="Azure CLI"
--8<-- "includes/cmd/az/az-account-list-locations.sh"
```

```sh title="gcloud"
# Display available regions
gcloud compute regions list --format json
```



</div>


[johnkerl/miller](https://github.com/johnkerl/miller)

```sh
# Display JSON as a table
mlr --ijson --opprint cat
```

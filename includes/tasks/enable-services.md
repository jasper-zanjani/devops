[Cloud APIs](https://cloud.google.com/apis) in GCP are equivalent to Azure [resource providers](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers).
Unlike Azure, which automatically registers resource providers on use, Cloud APIs must be enabled per project.

<div class="grid cards" markdown>

```sh title="gcloud"
--8<-- "includes/Commands/g/gcloud-services-enable.sh"
```

```sh title="az"
--8<-- "includes/Commands/a/az-provider-register.sh"
```

</div>

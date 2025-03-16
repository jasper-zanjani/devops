# IBM Cloud

!!! info "IBM Cloud CLI"

    --8<-- "includes/Commands/i/ibmcloud.md"

## [Terraform provider](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest)

The  provider for Terraform.

---

--8<-- "includes/tf/ibm/provider.md"

## Tasks


```sh title="API keys"
# Create an API key, saved to the current working directory
ibmcloud iam api-key-create $NAME --file $FILENAME --action-if-leaked DELETE

# List API keys
ibmcloud iam api-keys
```

---

**Creating an instance** requires:

-   **Image ID**
-   **Subnet ID**
-   **Volume ID**
-   **System type** ("s922", "s1022", "e980", or "e1080")

```sh
IMAGE_ID=$(ibmcloud pi images ls --json | jq -r '.images.[0].imageID')
SUBNET_ID=$(ibmcloud pi snet ls --json | jq -r '.networks.[0].networkID')

```

Other values have given defaults:

-   **Memory**: 2 GB
-   **Processor type** and **number**: 1 dedicated core
-   Storage tier: "tier3"

```sh title="Virtual machine operations"
--8<-- "includes/Commands/i/ibmcloud-pi-ins-act.sh"
```


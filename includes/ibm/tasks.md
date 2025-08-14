#### API key

--8<-- "includes/ibm/tasks/api-key.md"

#### Resource groups

--8<-- "includes/ibm/tasks/resource-groups.md"

#### Workspaces

--8<-- "includes/ibm/tasks/workspaces.md"

#### PowerVS subnets

--8<-- "includes/ibm/tasks/subnets.md"

#### Power

Working with Power Virtual Server in IBM Cloud requires not only a Region to be specified but a **datacenter**.

#### PowerVS instances

```terraform title="Representative deployment"
--8<-- "includes/tf/ibm/pi_instance.tf"
```

Deploying VM to PowerVS requires:

Item                | IBM Cloud CLI argument    | Terraform attribute                   | Description
---                 | ---                       | ---                                   | ---
System type         | `--sys-type`              | `pi_sys_type` (optional)              | Type of system (`s922`, `s1022`, `e980`, or `e1080` in increasing order of cost)
Machine type        | `--processor-type`, `-r`  | `pi_proc_type` (optional)             | Type of processor mode (`shared`, `capped`, or `dedicated` in increasing order of cost, with `dedicated` being default!)
Cores               | `--processors`, `-p`      | `pi_processors` (optional)            | Number of vCPUs to assign (0.25)
Memory              | `--memory`, `-m`          | `pi_memory` (optional)                | 2 GiB
Network interfaces  | `--subnets`, `-n`         | `pi_network`                          |  At least one private or public network is required.
OS image            | `--image`, `-i`           | `pi_image_id`                         |
SSH Key             | `--key-name`, `-k`        | `pi_key_pair_name`                    |
Virtual cores       | `--virtual-cores`         | `pi_virtual_cores_assigned` (optional) | 1
Storage type        | `--storage-tier`, `-t`    | `pi_storage_type`                     | Storage "tier" (`tier3` by default)
Storage volumes     |                           | `pi_volume_ids` (optional)            | IDs of storage volumes to be attached **in addition** to the boot volume (20 GB).
Cloud instance ID   |                           | `pi_cloud_instance_id`                | Possibly the account ID?

-   Subnet ID (1)
    {: .annotate }

    1.  

        ```sh
        IMAGE_ID=$(ibmcloud pi images ls --json | jq -r '.images.[0].imageID')
        SUBNET_ID=$(ibmcloud pi snet ls --json | jq -r '.networks.[0].networkID')
        ```

=== ":material-console: IBM Cloud CLI"

    ```sh
    ibmcloud pi instance create $NAME \
        --sys-type s922 \
        --processor-type shared \
        --processors 0.25 \
        --memory 2 \
        --subnets $SNET_ID \
        --image $IMAGE_ID \
        --key-name $KEY_NAME
    ```

    ```sh
    # Find available AIX images
    ibmcloud pi image list-catalog --json \
        | jq '.images[] | select(.specifications.operatingSystem=="aix")'
    ```

    Virtual machine 

    ```sh
    --8<-- "includes/cmd/ibmcloud/ibmcloud-pi-ins-act.sh"
    ```


=== ":material-terraform: Terraform"

    The 

    ```terraform
    --8<-- "includes/tf/ibm/pi_instance.tf"
    ```

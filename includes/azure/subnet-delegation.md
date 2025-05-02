Subnet delegation (1) enables a subnet to be designated for a specific Azure PaaS service.
This gives the injected service explicit permissions to create service-specific resources in the subnet when deploying a service.
{: .annotate }

1.  === "Links"

        -   [Website](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview)

    === "Tasks"

        ```sh title="az"
        --8<-- "includes/cmd/az/az-network-vnet-subnet-delegation.sh"
        ```



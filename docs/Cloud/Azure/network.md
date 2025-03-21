# Networking

#### Virtual network [:fontawesome-solid-coins:](https://azure.microsoft.com/en-us/pricing/details/virtual-network/ "free of charge")

A **vnet** can only be in a single Azure region and can only connect to other Azure resources in that region.
Creating a vnet requires specifying an **address prefix**: one or more non-overlapping IPv4 address ranges specified in CIDR notation (10.0.0.0/16 is used by default if one is not provided.
A **subnet** is a component of a vnet that takes up a portion of its address space.
Different routing, traffic, and security policies can be applied to each subnet.

<div class="grid cards" markdown>


-   [**Subnet delegation**](https://learn.microsoft.com/en-us/azure/virtual-network/subnet-delegation-overview) (1) enables a subnet to be designated for a specific Azure PaaS service.
    This gives the injected service explicit permissions to create service-specific resources in the subnet when deploying a service.
    {: .annotate }

    1. 

        === "Azure CLI"

            ```sh
            --8<-- "includes/Commands/a/az-network-vnet-subnet-delegation.sh"
            ```

-   [**Bastion**](https://azure.microsoft.com/en-us/products/azure-bastion/#Features-3) [:fontawesome-solid-coins:](https://azure.microsoft.com/en-us/pricing/details/azure-bastion/)




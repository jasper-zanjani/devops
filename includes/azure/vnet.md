A virtual network or vnet (1) can only be in a single Azure region and can only connect to other Azure resources in that region.
Creating a vnet requires specifying an **address prefix**: one or more non-overlapping IPv4 address ranges specified in CIDR notation (10.0.0.0/16 is used by default if one is not provided.
A **subnet** is a component of a vnet that takes up a portion of its address space.
Different routing, traffic, and security policies can be applied to each subnet.
{: .annotate }

1.  === "Links"

        -   [Pricing](https://azure.microsoft.com/en-us/pricing/details/virtual-network/ "free of charge")

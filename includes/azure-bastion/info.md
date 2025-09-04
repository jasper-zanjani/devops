An Azure Bastion host allows public access to a VM that has no public IP address.
It must be placed in the same vnet but in its own subnet named (exactly) **"AzureBastionSubnet"**.
Without this named subnet present, the bastion resource cannot be created.

```sh
--8<-- "includes/cmd/az/network-bastion.sh
```

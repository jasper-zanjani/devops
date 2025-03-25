Load balancers redistribute traffic from a frontend pool to a backend pool using rules. 

**Health probes** determine the health of the VMs in the backend pool: if they don't respond then new connections won't be sent. 
By default, Azure Load Balancer stores rules in a **5-tuple**:

1. Source IP address
2. Source port
3. Destination IP address
4. Destination ports
5. IP Protocol number

Azure Load Balancers come in 2 pricing tiers:

1. **Basic** (free)
2. **Standard** charged based on the number of rules and the data that is processed.

Both boot and **guest OS** diagnostics can be enabled [on](#enable-on-deployment) or [after](#enable-after-deployment) VM creation.

Azure VMs have built-in extensions that enable configuration management. 2 most common extensions for configuration management:

- Windows PowerShell **Desired State Configuration (DSC)** allows you to define the state of a VM using **PowerShell Desired State Configuration language** 

A VM may have more than one **Network Interface Card (NIC)**, but they must belong to the same region as the VM itself. All NICs on a VM must also be attached to the same VNet.


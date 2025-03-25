These high-availability options are mutually exclusive:

-   **Availability zones** protect from datacenter-level failures by providing physical and logical separation between VM instances.
    Zones have independent power sources, network, and cooling, and there are at least 3 zones in every region.

-   **Availability sets** offer redundancy for VMs in the same application tier, ensuring at least one VM is available in the case of a host update or problem. 
    Each VM is assigned a **fault domain** (representing separate physical racks in the datacenter) and an **update domain** (representing groups of VMs and underlying physical hardware that can be rebooted at the same time for host updates). 
    Availability sets have a maximum of 20 update domains and 3 fault domains. 

**VM scale sets** (VMSS) support the ability to dynamically add and remove instances. 
By default, a VMSS supports up to 100 instances or up to 1000 instances if deployed with the property `singlePlacementGroup` set to false (called a **large-scale set**). 
A **placement group** is a concept similar to an availability set in that it assigns fault and upgrade domains. 
By default, a scale set consists of only a single placement group, but disabling this setting allows the scale set to be composed of multiple placement groups. 
If a custom image is used instead of one in the gallery, the limit is actually 300 instances.

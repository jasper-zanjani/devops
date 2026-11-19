!!! info

    --8<-- "includes/dns.md"

An [Azure Private DNS zone](https://learn.microsoft.com/en-us/azure/dns/private-dns-privatednszone) is an Azure resource that resolves DNS names within private networks.
Private DNS zones can be linked to VNets in one of two ways:

- **Registration**: VM hostnames in that VNet are automatically registered in the zone
- **Resolution**: VNet can query the zone but does not auto-register records

Private Endpoints can also be integrated with a Private DNS zone.

resource "azurerm_virtual_network" "vnet" {
  name = var.vnet_name
  resource_group_name = azurerm_resource_group.group.name
  location = azurerm_resource_group.group.location
  address_space = ["10.0.0.0/16"]

  subnet {
    name = "sn0"
    address_prefixes = ["10.0.0.0/24"]
  }
  subnet {
    name = "sn1"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet {
    name = "sn2"
    address_prefixes = ["10.0.2.0/24"]
  }
}

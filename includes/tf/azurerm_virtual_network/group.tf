resource "azurerm_resource_group" "group" {
  name = "rg-${random_id.suffix.hex}"
  location = var.location
}

resource "random_id" "suffix" {
  byte_length = 2
}

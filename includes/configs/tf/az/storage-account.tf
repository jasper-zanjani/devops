variable "storage_account_name" {}

resource "azurerm_storage_account" "storage_account" {
  name  = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg-tf.name
  location = azurerm_resource_group.rg-tf.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name = "container-terraform"
  storage_account_id = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}

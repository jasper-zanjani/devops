resource "azurerm_storage_blob" "blob" {
  name  = "blob-from-terraform.txt"
  storage_account_name = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type = "Block"
  source = "/home/jasper/scratch/tf/words.txt"
}

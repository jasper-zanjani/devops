resource "azurerm_windows_virtual_machine" "main" {
  name = "${var.environment}${var.project}.."
  admin_username = var.admin_username
  admin_password = var.admin_password
  resource_group_name = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size = "Standard_DS1_v2"

}


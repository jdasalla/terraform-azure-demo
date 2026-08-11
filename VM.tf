/*resource "azurerm_windows_virtual_machine" "vm" {
  name                = "demo-vm1"
  location            = azurerm_resource_group.RG_Terraform.location
  resource_group_name = azurerm_resource_group.RG_Terraform.name
  size                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!" # ⚠️ Change this to a secure password

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    name                 = "demo-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter" # Gamitin ang Windows Server 2022
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Azure AD Login extension
resource "azurerm_virtual_machine_extension" "aad_login" {
  name                 = "AADLoginForWindows"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADLoginForWindows"
  type_handler_version = "2.2"
}
*/

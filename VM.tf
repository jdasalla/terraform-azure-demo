resource "azurerm_windows_virtual_machine" "vm" {
  name                = "demo-vm"
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
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

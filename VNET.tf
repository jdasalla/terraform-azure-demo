#Virtual Network

resource "azurerm_virtual_network" "vnet" {                          # "vnet" is Terraform identifier for "demo-vnet1"(sometimes called the local name or reference name).
  name                = "demo-vnet1"                                 # "demo-vnet1"  is the actual name of VNET that will appear in Azure
  location            = azurerm_resource_group.RG_Terraform.location # pulls the region (like Southeast Asia) from the Resource Group you defined.
  resource_group_name = azurerm_resource_group.RG_Terraform.name     #pulls the name (like demo_resourcegroup) from the Resource Group you defined.
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet1" {                              # "subnet" is Terraform identifier for "demo-subnet"(sometimes called the local name or reference name).
  name                 = "demo-subnet1"                            # "demo-subnet"  is the actual name of subnet that will appear in Azure
  resource_group_name  = azurerm_resource_group.RG_Terraform.name #pulls the region (like Southeast Asia) from the Resource Group you defined.
  virtual_network_name = azurerm_virtual_network.vnet.name        ##pulls the name (like demo_vnet1) from the vnet you defined.
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {                              # "subnet" is Terraform identifier for "demo-subnet"(sometimes called the local name or reference name).
  name                 = "demo-subnet2"                            # "demo-subnet"  is the actual name of subnet that will appear in Azure
  resource_group_name  = azurerm_resource_group.RG_Terraform.name #pulls the region (like Southeast Asia) from the Resource Group you defined.
  virtual_network_name = azurerm_virtual_network.vnet.name        ##pulls the name (like demo_vnet1) from the vnet you defined.
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_public_ip" "vm_ip" {
  name                = "demo-vm-publicip"
  location            = azurerm_resource_group.RG_Terraform.location
  resource_group_name = azurerm_resource_group.RG_Terraform.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "demo-nic"
  location            = azurerm_resource_group.RG_Terraform.location
  resource_group_name = azurerm_resource_group.RG_Terraform.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.4"
    public_ip_address_id          = azurerm_public_ip.vm_ip.id
  }
}

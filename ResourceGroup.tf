/*# Resource Group

resource "azurerm_resource_group" "RG_Terraform" { #"RG_Terraform" is Terraform identifier for "demo-rg"(sometimes called the local name or reference name).
  name     = "demo-rg"                             # This is the actual name of Resource Group that will appear in Azure
  location = "eastasia"                            # Choose your Azure region (e.g., East US, West Europe, Southeast Asia)

  tags = {
    environment = "lab"
    owner       = "dasallajason20143877@gmail.com"
    region      = "Southeast Asia"
  }
}


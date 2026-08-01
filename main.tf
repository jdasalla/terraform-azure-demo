#-----Terraform block (terraform {}) → defines global settings for your project, such as required providers (Azure, AWS, GCP) and the minimum Terraform CLI version.

terraform {
    required_providers {
        azurerm = {
            source ="hashicorp/azurem"
            version = "5.0.1"
        }
    }
    required_version = "1.2.0"
    
    }

#-----Provider block (provider {}) → tells Terraform which cloud platform to connect to and how. Example: provider "azurerm" for Azure, provider "aws" for Amazon Web Services.
   
    provider "azurem"{
        features {}
    }
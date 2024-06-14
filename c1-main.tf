#Terraform Settings Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
}

#Provider for Central India (default Provider
provider "azurerm" {
  features {}
}

#PRovider for Asutralia East
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-australiaeast"
}
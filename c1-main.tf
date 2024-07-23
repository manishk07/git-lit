#Terraform Settings Block
terraform {
  required_version = ">1.0.0"
  #required_version = "~> 0.14.3" ~ means it allows only the rightmost version component to increment
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
      #version = ">=2.0.0, <=2.64.0"
      #version = "~2.64" #For Production Grade
    }
  }
}

#Provider-1 for Central India (default Provider
provider "azurerm" {
  features {}
}

#Provider-2 for Australia East
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-australiaeast"
}
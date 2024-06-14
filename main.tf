#Terraform Settings Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}

#Configure MS Azure provider
provider "azurerm" {
  features {}

}

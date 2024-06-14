#Terraform Settings Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.0.0"
    }
  }
}

#Configure MS Azure provider
provider "azurerm" {
  features {}

}

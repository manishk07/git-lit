#Create Resource Group
resource "azurerm_resource_group" "myrg1" {
  name     = "myrg-1"
  location = "Central India"
}

#Create Random String
resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
}

#Create a Storage Account
resource "azurerm_storage_account" "mystore" {
  name                     = "mystorage${random_string.myrandom.id}"
  location                 = azurerm_resource_group.myrg1.location
  resource_group_name      = azurerm_resource_group.myrg1.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Dept = "IT"
  }
}
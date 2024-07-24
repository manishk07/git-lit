#Create Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = "RG1"
  location = "Central India"
}
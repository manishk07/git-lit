resource "azurerm_resource_group" "rg-centralindia" {
  name     = "rg-centralindia"
  location = "Central India"
}

resource "azurerm_resource_group" "rg-australiaeast" {
  name     = "rg-australiaeast"
  location = "Australia East"
  provider = azurerm.provider2-australiaeast

}
#Create Virtual Network
resource "azurerm_virtual_network" "VNET1" {
  name                = "VNET1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  address_space       = ["10.0.0.0/16"]
}

#Create Subnet
resource "azurerm_subnet" "SUBNET1" {
  name                 = "SUBNET1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.VNET1.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "SUBNET2" {
  name                 = "SUBNET2"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.VNET1.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Create Public IP Address
resource "azurerm_public_ip" "PIP1" {
  name                = "Public_IP1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  allocation_method   = "Static"
  tags = {
    "env" = "PROD"
  }
}

#Create Network Interface
resource "azurerm_network_interface" "NIC1" {
  name                = "NIC1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  ip_configuration {
    name                          = "Internal"
    subnet_id                     = azurerm_subnet.SUBNET1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.PIP1.id
  }

}
# modules/network/network.tf

resource "azurerm_virtual_network" "vnet" {
  name                = var.network_name
  resource_group_name = var.network_rg
  location            = var.network_location
  address_space       = ["10.0.0.0/16"]
}

# Bonne pratique : toujours ajouter au moins un subnet
resource "azurerm_subnet" "default" {
  name                 = "snet-default"
  resource_group_name  = var.network_rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "vnet" {
  name                = "aks-vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr_range]
}
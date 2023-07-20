resource "azurerm_resource_group" "rg" {
  count    = var.cluster_count
  name     = "${var.locations[count.index]}-aks-rg"
  location = var.locations[count.index]
}
resource "azurerm_kubernetes_cluster" "aks_clusters" {
  count = var.cluster_count
  #name                = var.cluster_names[count.index]
  name                = "${var.locations[count.index]}-aks"
  location            = var.locations[count.index]
  resource_group_name = "${var.locations[count.index]}-aks-rg"
  dns_prefix          = "${var.locations[count.index]}-aks"
  kubernetes_version  = var.kubernetes_version
  #node_resource_group = "${var.cluster_names[count.index]}-nodes"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_type
    type       = "VirtualMachineScaleSets"
  }

  #  service_principal {
  #    client_id     = var.client_id
  #    client_secret = var.client_secret
  #  }
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}
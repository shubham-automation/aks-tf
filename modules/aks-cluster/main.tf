resource "azurerm_kubernetes_cluster" "aks_clusters" {

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.cluster_name
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
}
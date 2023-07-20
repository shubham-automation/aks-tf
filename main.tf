module "resource_group" {
  source = "./modules/resource-group"
  locations = var.locations
  cluster_count = var.cluster_count
}

module "aks_cluster" {
  source = "./modules/aks-cluster"
  cluster_count = var.cluster_count
  locations = var.locations
  node_count = var.node_count
  node_type = var.node_type
  kubernetes_version = var.kubernetes_version
  depends_on = [module.resource_group]
}
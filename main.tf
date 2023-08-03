module "aks_cluster" {
  source             = "./modules/aks-cluster"
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  location           = var.location
  node_count         = var.node_count
  node_type          = var.node_type
  rg_name            = var.rg_name
}
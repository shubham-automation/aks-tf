module "resource_group" {
  count               = var.is_new_resource_group ? 1 : 0
  source              = "./modules/resource-group"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vnet" {
  source = "./modules/vnet"
  location = var.location
  resource_group_name = var.is_new_resource_group == true ? module.resource_group[0].resource_group_name : var.exisiting_resource_group_name
  vnet_cidr_range = var.vnet_cidr_range
}

module "subnet" {
  source = "./modules/subnet"
  resource_group_name = var.is_new_resource_group == true ? module.resource_group[0].resource_group_name : var.exisiting_resource_group_name
  subnet_cidr_range = var.subnet_cidr_range
  vnet_name = module.vnet.vnet_name
}

module "aks_cluster" {
  source             = "./modules/aks-cluster"
  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version
  location           = var.location
  node_count         = var.node_count
  node_type          = var.node_type
  rg_name            = var.is_new_resource_group == true ? module.resource_group[0].resource_group_name : var.exisiting_resource_group_name
  subnet_id          = module.subnet.subnet_id
}
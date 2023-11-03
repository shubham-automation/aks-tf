variable "node_type" {
  type        = string
  description = "The type of AKS worker node."
  default     = "Standard_E4ads_v5"
}

variable "cluster_name" {
  type        = string
  description = "A name of the AKS cluster."
  default     = "test" #"dev-accelitas-k8s-cluster"
}

variable "exisiting_resource_group_name" {
  type        = string
  description = "A resource group name in which AKS cluster will be created"
  default     = "accelitas-kubernetes-dev"
}

variable "location" {
  type        = string
  description = "Azure region in which AKS cluster will be created."
  default     = "centralus"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in each AKS cluster."
  default     = 2 #4
}

#variable "client_id" {
#  type        = string
#  description = "The client ID of the service principal used for the AKS clusters."
#}
#
#variable "client_secret" {
#  type        = string
#  description = "The client secret of the service principal used for the AKS clusters."
#}

variable "kubernetes_version" {
  type        = string
  description = "The k8s version for the AKS clusters."
  default     = "1.26.3"
}

variable "is_new_resource_group" {
  type        = bool
  description = "Whether to create new resource group: true/false"
}

variable "resource_group_name" {
  type        = string
  description = "New resource group name to be created"
}

variable "subnet_cidr_range" {
  type = string
  description = "Subnet CIDR Range"
}

variable "vnet_cidr_range" {
  type = string
  description = "Vnet CIDR Range"
}
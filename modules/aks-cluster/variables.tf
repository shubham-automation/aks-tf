#variable "resource_group_name" {
#  type        = string
#  description = "The name of the resource group in which to create the AKS clusters."
#}
#
variable "node_type" {
  type        = string
  description = "The type of AKS worker node."
}

#variable "cluster_names" {
#  type        = list(string)
#  description = "A list of names for the AKS clusters."
#}

variable "cluster_count" {
  type        = number
  description = "The number of AKS clusters to create"
}

variable "locations" {
  type        = list(string)
  description = "A list of Azure regions in which to create the AKS clusters."
}

variable "node_count" {
  type        = number
  description = "The number of nodes in each AKS cluster."
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
}

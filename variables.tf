#variable "resource_group_name" {
#  type        = string
#  description = "The name of the resource group in which to create the AKS clusters."
#}

variable "node_type" {
  type        = string
  description = "The type of AKS worker node."
  #default = "Standard_DS2_v2"
}

#variable "cluster_names" {
#  type        = list(string)
#  description = "A list of names for the AKS clusters."
#}

variable "cluster_count" {
  type        = number
  description = "The number of AKS clusters to create"
  #default = "2"
}

variable "locations" {
  type        = list(string)
  description = "A list of Azure regions in which to create the AKS clusters."
  #default = ["eastus","westus"]
}

variable "node_count" {
  type        = number
  description = "The number of nodes in each AKS cluster."
  #default = 2
}

#variable "client_id" {
#  type        = string
#  description = "The client ID of the service principal used for the AKS clusters."
#  default = "7d4abc62-c0cc-44c1-b66f-190312ab9255"
#}
#
#variable "client_secret" {
#  type        = string
#  description = "The client secret of the service principal used for the AKS clusters."
#  default = "V_z8Q~do4DiOny4kxvZHywrBCP0ufOu1QoWFbduJ"
#}

variable "kubernetes_version" {
  type        = string
  description = "The k8s version for the AKS clusters."
}

#variable "storage_account_name" {
#  type        = string
#  description = "Azure storage account to store tfstate file"
#}
#
#variable "container_name" {
#  type        = string
#  description = "Azure storage account's container to store tfstate file"
#}
#
#variable "tfstate_file_name" {
#  type        = string
#  description = "TFstate file name to store in Azure container"
#}
#
#variable "storage_account_access_key" {
#  type        = string
#  description = "Azure storage account's access key"
#}

#variable "subscription_id" {
#  type        = string
#  description = "The Azure subscription ID"
#}

#variable "tenant_id" {
#  type        = string
#  description = "The Azure Tenant ID"
#}

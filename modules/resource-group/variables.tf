variable "locations" {
  type        = list(string)
  description = "A list of Azure regions in which to create the Resource Group."
}

variable "cluster_count" {}
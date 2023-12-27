

variable "resource_group_name" {
  description = "resource group that the vnet resides in"
  default     = "Run IT on Cloud"
}

variable "vnet_name" {
  description = "name of the vnet that this subnet will belong to"
  default     = "dbs-vnet"
}

variable "subnet_cidr" {
  description = "the subnet cidr range"
}

variable "location" {
  description = "the cluster location"
}

variable "address_space" {
  description = "Network address space"
}

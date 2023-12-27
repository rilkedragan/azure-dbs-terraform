#variable "client_id" {}

#variable "client_secret" {}

variable "node_count" {
  description = "number of nodes to deploy"
  default     = 2
}

variable resource_group_name {
  description = "name of the resource group to deploy AKS cluster in"
  default     = "dbs-rg"
}

variable location {
  description = "azure location to deploy resources"
  default     = "westeurope"
}


variable subnet_cidr {
  description = "the subnet cidr range"
  type        = list(string)
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24"]
}

variable "vnet_name" {
  description = "name of the vnet that this subnet will belong to"
  default     = "dbs-vnet"
}

variable "address_space" {
  description = "The address space that is used the virtual network"
  default     = "10.1.0.0/16"
}

variable "sku" {
  description = "The SKU of the Databricks workspace"
  default     = "premium"
  
}

variable "managed_resource_group_name" {
  description = "managed resource group name"
  default    = "managed-dbs-rg"
}

variable "node_type_id" {
  description = "node type id of the cluster"
  default     = "Standard_DS3_v2"
  
}
variable "autotermination_minutes" {
  description = "autotermination minutes of the cluster"
  default     = 20
  
}
variable "resource_group_name" {
  description = "resource group that the vnet resides in"
 
}

variable "name" {
  description = "name of the workspace"
 
}
variable "vnet_id" {
  description = "id of the vnet that this subnet will belong to"
}

variable "public_subnet" {
  description = "public subnet for the databricks worksoace"
}

variable "private_subnet" {
  description = "private subnet for the databricks worksoace"
}
variable "location" {
  description = "the cluster location"
}

variable "endpoint_name" {
  description = "name of the private endpoint"
}


variable "sku" {
  description = "sku of the workspace"
  default     = "premium"
}
variable "public_subnet_id" { 
  description = "id of the public subnet"  
}
variable "private_subnet_id" { 
  description = "id of the private subnet"  
}

variable "global_auto_termination_minute" {
  description = "global auto termination minutes"
  default     = 20
  
}

variable "managed_resource_group_name" {
  description = "managed resource group name"
    
}
variable "cluster_name" {
  description = "name of the cluster"
  default     = "Shared Autoscaling"
  
}
variable "node_type_id" {
  description = "node type id of the cluster"
  default     = "Standard_DS3_v2"
  
}
variable "autotermination_minutes" {
  description = "autotermination minutes of the cluster"
  default     = 20
  
}
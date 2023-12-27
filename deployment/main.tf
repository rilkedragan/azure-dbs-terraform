# Cluster Resource Group

resource "azurerm_resource_group" "databricks-rg" {
  name     = var.resource_group_name
  location = var.location
}

# AKS Cluster Network

module "dbs_network" {
  source              = "../modules/dbs_network"
  vnet_name           = var.vnet_name
  resource_group_name = azurerm_resource_group.databricks-rg.name
  subnet_cidr         = var.subnet_cidr
  location            = var.location
  address_space       = var.address_space
}


# DataBricks Dev Workspace

module databricks-devs {
  source              = "../modules/databricks"
  resource_group_name = azurerm_resource_group.databricks-rg.name
  name                = "databricks-dev" 
  location            = var.location
  sku                 = var.sku
  private_subnet      = module.dbs_network.dbs_dev_private_subnet_name
  public_subnet       = module.dbs_network.dbs_dev_public_subnet_name
  endpoint_name       = "databricks-dev-endpoint"
  vnet_id             = module.dbs_network.dbs_vnet_id
  private_subnet_id   = module.dbs_network.dbs_dev_private_subnet_id
  public_subnet_id    = module.dbs_network.dbs_dev_public_subnet_id
  managed_resource_group_name = var.managed_resource_group_name
  node_type_id                = var.node_type_id
  autotermination_minutes     = var.autotermination_minutes
  cluster_name                = "dev-dbs-cluster"
}
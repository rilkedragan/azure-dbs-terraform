resource "azurerm_network_security_group" "nsg" {
  name                = "acctest-nsg-private-1101"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = var.public_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = var.private_subnet_id
  network_security_group_id = azurerm_network_security_group.nsg.id
}


resource "azurerm_databricks_workspace" "dbs_workspace" {
  name                        = var.name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.sku
  managed_resource_group_name = var.managed_resource_group_name
  
  
  custom_parameters {
    no_public_ip        = true
    private_subnet_name = var.private_subnet
    public_subnet_name  = var.public_subnet
    virtual_network_id  = var.vnet_id
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private.id
  }
   depends_on = [
    azurerm_subnet_network_security_group_association.public,
    azurerm_subnet_network_security_group_association.private
  ]
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  depends_on = [ azurerm_databricks_workspace.dbs_workspace ]
}
resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = var.cluster_name
  spark_version           =  data.databricks_spark_version.latest_lts.id
  node_type_id            = var.node_type_id
  autotermination_minutes = var.autotermination_minutes
  autoscale {
    min_workers = 1
    max_workers = 3
  }
  }
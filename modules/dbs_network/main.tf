resource "azurerm_virtual_network" "dbs_vnet" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  resource_group_name = var.resource_group_name
  location            = var.location
}
resource "azurerm_subnet" "dbs_subnet" {
  count                = length(var.subnet_cidr)
  name                 = "subnet${count.index}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.dbs_vnet.name
  address_prefixes     = [var.subnet_cidr[count.index]]
  delegation {
        name = "databricks"
        service_delegation {
            name = "Microsoft.Databricks/workspaces"
            actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
        }
    }
}






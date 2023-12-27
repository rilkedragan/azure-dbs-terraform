output "dbs_dev_public_subnet_id" {
  value = azurerm_subnet.dbs_subnet[0].id
}
output "dbs_dev_private_subnet_id" {
  value = azurerm_subnet.dbs_subnet[1].id
}

output "dbs_stage_public_subnet_id" {
  value = azurerm_subnet.dbs_subnet[2].id
}
output "dbs_stage_private_subnet_id" {
  value = azurerm_subnet.dbs_subnet[3].id
}
output "dbs_vnet_id" {
  value = azurerm_virtual_network.dbs_vnet.id
}

output "dbs_dev_public_subnet_name" {
  value = azurerm_subnet.dbs_subnet[0].name
}
output "dbs_dev_private_subnet_name" {
  value = azurerm_subnet.dbs_subnet[1].name
}

output "dbs_stage_public_subnet_name" {
  value = azurerm_subnet.dbs_subnet[2].name
}
output "dbs_stage_private_subnet_name" {
  value = azurerm_subnet.dbs_subnet[3].name
}


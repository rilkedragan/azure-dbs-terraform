output "workspace_hostname" {
  value = azurerm_databricks_workspace.dbs_workspace.workspace_url
}

output "databricks_id" {
  value = azurerm_databricks_workspace.dbs_workspace.workspace_id
}
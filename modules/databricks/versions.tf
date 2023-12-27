
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
        databricks = {
      source  = "databricks/databricks"
      version = "1.0.0"
    }
  }

}
provider "azurerm" {
  features {}
}
provider "databricks" {
  host = azurerm_databricks_workspace.dbs_workspace.workspace_url
}
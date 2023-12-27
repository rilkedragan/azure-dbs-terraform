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
  backend "azurerm" {
      resource_group_name  = "test-rg"
      storage_account_name = "testsarilke"
      container_name       = "dbs-tfstate"
      key                  = "terraform.tfstate"
  }

}
provider "azurerm" {
  features {}
}
provider "databricks" {
  host = azurerm_databricks_workspace.dbs_workspace.workspace_url
}
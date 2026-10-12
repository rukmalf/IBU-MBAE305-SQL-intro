# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

locals {
  name_suffix = "ibustudent"
  # ideally, comment above and replace with your own unique suffix based on your email
  # e.g.: if your IBU email is jsmith9876@myibu.ca, 
  # then your name_suffix should be jsmith9876
  # name_suffix = "jsmith9876"

  # NOTE: you might have to change the resource_group_location and db_location values 
  # below to a region that is available to you. Here's how to check regions you have access to:
  # https://learn.microsoft.com/en-us/answers/questions/5925396/which-regions-work-for-the-azure-student-account
  resource_group_location = "Canada Central"
  db_location = "westus3"

  # NOTE: change this to a secure passwword of your choice
  db_admin_password = "ChangeMe123!"
}

# Create a Resource Group for our SQL Server and Database
resource "azurerm_resource_group" "rg" {
  name = "rg-${local.name_suffix}"
  location = local.resource_group_location
}

# Create an Azure SQL Server instance
resource "azurerm_mssql_server" "sql_server" {
  name                         = "srv-${local.name_suffix}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = local.db_location
  version                      = "12.0"
  administrator_login          = "dbadmin"
  administrator_login_password = local.db_admin_password
}

# Create an Azure SQL Database instance
resource "azurerm_mssql_database" "sql_db" {
  name                = "free-db-${local.name_suffix}"
  server_id           = azurerm_mssql_server.sql_server.id
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  license_type        = "LicenseIncluded"
  max_size_gb         = 32
  #sku_name            = "S0"
  storage_account_type = "Local"
}
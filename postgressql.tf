# Prerequisites
# Before you proceed ensure you have the following prerequisites:

# Terraform installed on your local machine.
# An Azure account with appropriate permissions to create resources.
# Basic knowledge of Terraform and Azure concepts.
# Terraform Configuration
# The configuration includes the following resources:

# Resource Group (azurerm_resource_group): Defines the resource group where all Azure resources will be deployed.
# Virtual Network (azurerm_virtual_network): Defines the virtual network to which the PostgreSQL server will be connected.
# Subnet (azurerm_subnet): Defines the subnet within the virtual network for the PostgreSQL server.
# PostgreSQL Server (azurerm_postgresql_server): Defines the PostgreSQL server instance, including server name, SKU, storage, and credentials.
# Virtual Network Rule (azurerm_postgresql_virtual_network_rule): Defines a virtual network rule to allow access to the PostgreSQL server from specified subnets.
# Usage

# Follow these steps to deploy the PostgreSQL database:

# Clone Repository: Clone this repository to your local machine:


resource "azurerm_resource_group" "example" {
  name     = var.resource-group
  location = var.region
}

resource "azurerm_virtual_network" "example" {
  name                = var.vnet
  address_space       = var.network-prefix
  location            = var.region
  resource_group_name = var.resource-group
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.resource-group
  virtual_network_name = var.vnet
  address_prefixes     = var.subnet-prefix
  service_endpoints    = ["Microsoft.Sql"]
}

resource "azurerm_postgresql_server" "example" {
  name                = var.psql-name
  location            = var.region
  resource_group_name = azurerm_resource_group.example.name

  sku_name = "GP_Gen5_2"

  storage_mb            = 5120
  backup_retention_days = 7


  administrator_login          = var.username
  administrator_login_password = var.password
  version                      = "9.5"
  public_network_access_enabled = true
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_virtual_network_rule" "example" {
  name                                 = var.psql-name
  resource_group_name                  = var.resource-group
  server_name                          = azurerm_postgresql_server.example.name
  subnet_id                            = azurerm_subnet.internal.id
  ignore_missing_vnet_service_endpoint = true
}

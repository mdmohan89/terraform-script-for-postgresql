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
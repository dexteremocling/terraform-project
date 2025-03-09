
resource "azurerm_postgresql_server" "db_instance" {
  name                = "2396-db"
  location            = "Canada Central"
  resource_group_name = var.database_rg_name
  sku_name            = "B_Gen5_1"
  storage_mb          = 5120
  backup_retention_days = 7
  geo_redundant_backup_enabled = false

  administrator_login    = var.db_admin_username
  administrator_login_password = var.db_admin_password

  version              = "11"
  ssl_enforcement_enabled = true

  tags = local.common_tags
}


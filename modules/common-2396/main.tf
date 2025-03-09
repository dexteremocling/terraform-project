
resource "azurerm_log_analytics_workspace" "log" {
  name                = "loganalytics2396"
  location            = var.location
  resource_group_name = var.common_rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.common_tags
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageaccount2396"
  location                 = var.location
  resource_group_name      = var.common_rg_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.common_tags
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = "recoveryvault2396"
  location            = var.location
  resource_group_name = var.common_rg_name
  sku                 = "Standard"
  tags                = local.common_tags
}


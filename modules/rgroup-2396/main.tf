
resource "azurerm_resource_group" "rgroup-2396" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "network-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "common-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "vmlinux-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "vmwindows-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "datadisk-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "loadbalancer-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_resource_group" "database-2396" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}


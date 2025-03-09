
resource "azurerm_virtual_network" "vnet" {
  name                = "2396-VNET"
  location            = var.location
  resource_group_name = var.network_rg_name
  address_space       = ["10.0.0.0/16"]
  tags                = local.common_tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "2396-SUBNET"
  resource_group_name  = var.network_rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "2396-NSG"
  location            = var.location
  resource_group_name = var.network_rg_name
  tags                = local.common_tags
}

resource "azurerm_network_security_rule" "rules" {
  count                       = 4
  name                        = "AllowPort${count.index}"
  priority                    = 100 + count.index
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["22", "3389", "5985", "80"]
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

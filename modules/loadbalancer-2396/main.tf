
resource "azurerm_lb" "loadbalancer" {
  name                = "2396-lb"
  location            = var.location
  resource_group_name = var.loadbalancer_rg_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "PrivateIP"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"  # Choose a valid IP in 2396-SUBNET
  }

  tags = local.common_tags
}


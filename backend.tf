
terraform {
  backend "azurerm" {
    resource_group_name  = "2396backendrg"
    storage_account_name = "2396tfstatesa"
    container_name       = "2396tfstatecontainer"
    key                  = "terraform.tfstate"
  }
}


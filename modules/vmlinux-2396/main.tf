

resource "azurerm_availability_set" "linux_avset" {
  name                = "linux-2396-avset"
  location            = var.location
  resource_group_name = var.vmlinux_rg_name
  managed             = true
  tags                = local.common_tags
}


resource "azurerm_public_ip" "linux_pip" {
  for_each            = toset(["vm1", "vm2"])
  name                = "linux-2396-${each.key}-pip"
  location            = var.location
  resource_group_name = var.vmlinux_rg_name
  allocation_method   = "Static"
  domain_name_label   = "linux-2396-${each.key}-${random_id.dns_suffix.hex}"
  tags                = local.common_tags
}

resource "random_id" "dns_suffix" {
  byte_length = 4
}


resource "azurerm_network_interface" "linux_nic" {
  for_each            = toset(["vm1", "vm2"])
  name                = "linux-2396-${each.key}-nic"
  location            = var.location
  resource_group_name = var.vmlinux_rg_name

  ip_configuration {
    name                          = "linux-2396-${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }

  tags = local.common_tags
}


resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each            = toset(["vm1", "vm2"])
  name                = "linux-2396-${each.key}"
  resource_group_name = var.vmlinux_rg_name
  location            = var.location
  availability_set_id = azurerm_availability_set.linux_avset.id
  size                = "Standard_B1ms"
  admin_username      = var.linux_admin_username
  disable_password_authentication = true
  
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]

  admin_ssh_key {
    username   = var.linux_admin_username
    public_key = file(var.public_key_path)
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics {
    storage_account_uri = "https://${var.storage_account_name}.blob.core.windows.net"
  }

  tags = local.common_tags
}

resource "time_sleep" "wait_for_vm" {
  create_duration = "60s"
  depends_on = [azurerm_linux_virtual_machine.linux_vm]
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each           = azurerm_linux_virtual_machine.linux_vm
  name               = "NetworkWatcherAgent"
  virtual_machine_id = each.value.id
  publisher          = "Microsoft.Azure.NetworkWatcher"
  type               = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"

  depends_on = [time_sleep.wait_for_vm]

  auto_upgrade_minor_version = true
}


resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each           = azurerm_linux_virtual_machine.linux_vm
  name               = "AzureMonitorAgent"
  virtual_machine_id = each.value.id
  publisher          = "Microsoft.Azure.Monitor"
  type               = "AzureMonitorLinuxAgent"
  type_handler_version = "1.19"

  depends_on = [azurerm_virtual_machine_extension.network_watcher]

  settings = <<SETTINGS
    {
      "enableAutomaticUpgrade": true
    }
  SETTINGS

  auto_upgrade_minor_version = true  # Ensure automatic minor version upgrades
}

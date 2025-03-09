
resource "azurerm_availability_set" "windows_avset" {
  name                = "windows2396-avset"
  location            = var.location
  resource_group_name = var.vmwindows_rg_name
  platform_fault_domain_count = 2
  platform_update_domain_count = 5
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.vm_count
  name                = "windows2396-vm${count.index + 1}-nic"
  location            = var.location
  resource_group_name = var.vmwindows_rg_name

  ip_configuration {
    name                          = "windows2396-vm${count.index + 1}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[count.index].id
  }

  tags = local.common_tags
}

resource "azurerm_public_ip" "windows_pip" {
  count               = var.vm_count
  name                = "windows2396-vm${count.index + 1}-pip"
  location            = var.location
  resource_group_name = var.vmwindows_rg_name
  allocation_method   = "Static"
  domain_name_label   = "win2396-vm${count.index + 1}-${random_id.dns_suffix.hex}"

  tags = local.common_tags
}

resource "random_id" "dns_suffix" {
  byte_length = 4
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count               = var.vm_count
  name                = "windows2396-vm${count.index + 1}"
  location            = var.location
  resource_group_name = var.vmwindows_rg_name
  size                = var.vm_size
  availability_set_id = azurerm_availability_set.windows_avset.id
  admin_username      = var.windows_admin_username
  admin_password      = var.windows_admin_password
  network_interface_ids = [azurerm_network_interface.windows_nic[count.index].id]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }

  tags = local.common_tags
}


resource "azurerm_virtual_machine_extension" "antimalware" {
  count                = var.vm_count
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.windows_vm[count.index].id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.5"

  tags = local.common_tags
}


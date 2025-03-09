
resource "azurerm_managed_disk" "datadisk" {
  count                = 3
  name                 = "2396-datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.datadisk_rg_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = local.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  count              = 3
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = var.vm_ids[count.index % length(var.vm_ids)]
  lun                = count.index
  caching            = "ReadWrite"
}


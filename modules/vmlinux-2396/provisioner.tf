
resource "null_resource" "show_hostname" {
  for_each = azurerm_linux_virtual_machine.linux_vm

  depends_on = [azurerm_linux_virtual_machine.linux_vm]

  provisioner "remote-exec" {
    inline = ["hostname"]
  }

  connection {
    type        = "ssh"
    user        = var.linux_admin_username
    host        = azurerm_public_ip.linux_pip[each.key].ip_address
    private_key = file(var.private_key_path)
  }
}


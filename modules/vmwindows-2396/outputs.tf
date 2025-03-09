
output "windows_vm_hostnames" {
  value = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "windows_vm_fqdns" {
  value = azurerm_public_ip.windows_pip[*].fqdn
}

output "windows_private_ip_addresses" {
  value = azurerm_network_interface.windows_nic[*].ip_configuration[0].private_ip_address
}

output "windows_public_ip_addresses" {
  value = azurerm_public_ip.windows_pip[*].ip_address
}

output "vm_id" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}


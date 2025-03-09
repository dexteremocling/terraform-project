
output "linux_vm_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.name]
}

output "linux_vm_fqdns" {
  value = flatten([for pip in azurerm_public_ip.linux_pip : pip.fqdn])
}

output "linux_private_ip_addresses" {
  value = flatten([for nic in azurerm_network_interface.linux_nic : nic.ip_configuration[0].private_ip_address])
}

output "linux_public_ip_addresses" {
  value = flatten([for pip in azurerm_public_ip.linux_pip : pip.ip_address])
}

output "vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}




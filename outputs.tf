
output "resource_group_name" {
  description = "The name of the created resource group"
  value       = module.rgroup-2396.resource_group_name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = module.network-2396.vnet_name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = module.network-2396.subnet_name
}

output "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace"
  value       = module.common-2396.log_analytics_workspace_name
}

output "recovery_vault_name" {
  description = "The name of the Recovery Services Vault"
  value       = module.common-2396.recovery_vault_name
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = module.common-2396.storage_account_name
}

output "linux_vm_hostnames" {
  description = "List of hostnames of the Linux VMs"
  value       = module.vmlinux-2396.linux_vm_hostnames
}

output "linux_vm_fqdns" {
  description = "List of FQDNs of the Linux VMs"
  value       = module.vmlinux-2396.linux_vm_fqdns
}

output "linux_private_ip_addresses" {
  description = "List of private IP addresses of the Linux VMs"
  value       = module.vmlinux-2396.linux_private_ip_addresses
}

output "linux_public_ip_addresses" {
  description = "List of public IP addresses of the Linux VMs"
  value       = module.vmlinux-2396.linux_public_ip_addresses
}

output "windows_vm_hostnames" {
  description = "List of hostnames of the Windows VMs"
  value       = module.vmwindows-2396.windows_vm_hostnames
}

output "windows_vm_fqdns" {
  description = "List of FQDNs of the Windows VMs"
  value       = module.vmwindows-2396.windows_vm_fqdns
}

output "windows_private_ip_addresses" {
  description = "List of private IP addresses of the Windows VMs"
  value       = module.vmwindows-2396.windows_private_ip_addresses
}

output "windows_public_ip_addresses" {
  description = "List of public IP addresses of the Windows VMs"
  value       = module.vmwindows-2396.windows_public_ip_addresses
}

output "datadisk_ids" {
  description = "List of attached data disk IDs"
  value       = module.datadisk-2396.datadisk_ids
}

output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = module.loadbalancer-2396.load_balancer_name
}

output "database_instance_name" {
  description = "The name of the Azure PostgreSQL database instance"
  value       = module.database-2396.database_instance_name
}


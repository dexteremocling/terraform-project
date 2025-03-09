
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "vmwindows_rg_name" {
  type = string
}

variable "subnet_id" {}

variable "location" {
  default = "Canada Central"
}

variable "storage_account_uri" {
  description = "Storage account URI for boot diagnostics"
  type        = string
}

variable "vm_count" {
  description = "Number of Windows VMs"
  type        = number
}

variable "vm_size" {
  description = "Size of the Windows VM"
  type        = string
  default     = "Standard_B1ms"
}

variable "windows_admin_username" {
  description = "Admin username for Windows VM"
  type        = string
}

variable "windows_admin_password" {
  description = "Admin password for Windows VM"
  type        = string
}


locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "vmlinux_rg_name" {
  type = string
}

variable "subnet_id" {}

variable "storage_account_name" {}

variable "vm_count" {}

variable "location" {
  default = "Canada Central"
}

variable "private_key_path" {
  description = "Path to the private SSH key"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public SSH key"
  type        = string
}

variable "linux_admin_username" {
  type    = string
}

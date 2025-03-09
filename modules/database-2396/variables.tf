
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "database_rg_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "db_admin_username" {
  type        = string
}

variable "db_admin_password" {
  type        = string
}

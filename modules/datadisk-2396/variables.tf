
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "vm_ids" {
  type = list(string)
}

variable "datadisk_rg_name" {
  type = string
}

variable "location" {
  type = string
}


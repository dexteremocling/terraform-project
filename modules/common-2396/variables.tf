
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "common_rg_name" {
  type = string
}

variable "location" {
  default = "Canada Central"
}


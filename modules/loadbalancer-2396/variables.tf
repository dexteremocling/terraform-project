
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name          = "dexter.emocling"
    ExpirationDate = "2025-12-31"
    Environment    = "Learning"
  }
}

variable "loadbalancer_rg_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "vm_ids" {
  description = "List of VM IDs to associate with the load balancer"
  type        = list(string)
}

variable "location" {
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the Load Balancer"
  type        = string
}


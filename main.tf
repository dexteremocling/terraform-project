module "rgroup-2396" {
  source = "./modules/rgroup-2396"
  resource_group_name = "2396-RG"
  location            = "Canada Central"
}

module "network-2396" {
  source             = "./modules/network-2396"
  network_rg_name    = module.rgroup-2396.resource_group_name
  location           = "Canada Central"
}

module "common-2396" {
  source             = "./modules/common-2396"
  common_rg_name     = module.rgroup-2396.resource_group_name
  location           = "Canada Central"
}

module "vmlinux-2396" {
  source              = "./modules/vmlinux-2396"
  vmlinux_rg_name    = module.rgroup-2396.resource_group_name
  location           = "Canada Central"
  subnet_id           = module.network-2396.subnet_id
  storage_account_name     = module.common-2396.storage_account_name
  vm_count            = 2
  linux_admin_username = "adminuser"
  public_key_path      = "/home/n01642396/.ssh/id_rsa.pub"
  private_key_path     = "/home/n01642396/.ssh/id_rsa"
}

module "vmwindows-2396" {
  source             = "./modules/vmwindows-2396"
  vmwindows_rg_name  = module.rgroup-2396.resource_group_name
  location           = "Canada Central"
  subnet_id          = module.network-2396.subnet_id
  windows_admin_username = "adminuser"
  windows_admin_password = "adminDex123"
  storage_account_uri = "https://2396tfstatesa.blob.core.windows.net/"
  vm_count            = 1
}

module "datadisk-2396" {
  source              = "./modules/datadisk-2396"
  datadisk_rg_name    = module.rgroup-2396.resource_group_name
  location            = "Canada Central"
  vm_ids              = concat(module.vmlinux-2396.vm_ids, module.vmwindows-2396.vm_id)
}

module "loadbalancer-2396" {
  source              = "./modules/loadbalancer-2396"
  loadbalancer_rg_name = module.rgroup-2396.resource_group_name
  location            = "Canada Central"
  vm_ids              = module.vmlinux-2396.vm_ids
  subnet_id           = module.network-2396.subnet_id
}

module "database-2396" {
  source              = "./modules/database-2396"
  database_rg_name    = module.rgroup-2396.resource_group_name
  db_admin_username    = "adminuser"
  db_admin_password    = "adminDex123"
}

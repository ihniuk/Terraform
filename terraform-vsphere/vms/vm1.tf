module "vm1" {
  source        = "../modules/vm"
  datacenter    = var.datacenter
  datastore     = var.datastore
  network_name  = var.network_name
  template_name = var.windows_template

  vm_name       = "vm1"
  ipv4_address  = "192.168.1.101"
  ipv4_gateway  = "192.168.1.1"
}

module "vm2" {
  source        = "../modules/vm"
  datacenter    = var.datacenter
  datastore     = var.datastore
  network_name  = var.network_name
  template_name = var.linux_template

  vm_name       = "vm2"
  ipv4_address  = "192.168.1.231"
  ipv4_gateway  = "192.168.1.1"
}

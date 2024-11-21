provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  server         = var.vsphere_server
  allow_unverified_ssl = true
}

terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.0"
    }
  }
}

provider "vsphere" {
  host     = var.vsphere_server
  user     = var.vsphere_user
  password = var.vsphere_password

  allow_unverified_ssl = true
}

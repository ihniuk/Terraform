terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">=2.8.1"
    }
  }
  required_version = ">= 1.1"
}

provider "vsphere" {
  vsphere_server     = var.vsphere_server
  user     = var.vsphere_user
  password = var.vsphere_password

  allow_unverified_ssl = true
}

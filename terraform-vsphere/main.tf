data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "windows_template" {
  name          = var.windows_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "linux_template" {
  name          = var.linux_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.vm_count

  name             = "${var.vm_name_prefix}-${count.index + 1}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.windows_template.guest_id

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.windows_template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.windows_template.disks.0.size
    eagerly_scrub    = false
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.windows_template.id

    customize {
      linux_options {
        host_name = "${var.vm_name_prefix}-${count.index + 1}"
        domain    = "local"
      }

      network_interface {
        ipv4_address = "192.168.1.${100 + count.index}"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.1.1"
    }
  }
}
module "vm1" {
  source = "./modules/vm"
  datacenter   = var.datacenter
  datastore    = var.datastore
  network_name = var.network_name
  template_name = var.windows_template

  vm_name       = "vm1"
  ipv4_address  = "192.168.1.101"
  ipv4_gateway  = "192.168.1.1"
}


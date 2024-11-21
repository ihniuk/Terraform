variable "datacenter" {}
variable "datastore" {}
variable "network_name" {}
variable "template_name" {}
variable "vm_name" {}
variable "num_cpus" {
  default = 2
}
variable "memory" {
  default = 2048
}
variable "domain" {
  default = "local"
}
variable "ipv4_address" {}
variable "ipv4_netmask" {
  default = 24
}
variable "ipv4_gateway" {}

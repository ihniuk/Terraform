variable "vsphere_user" {
  description = "The vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "The vSphere password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "The vSphere server address"
  type        = string
}

variable "datacenter" {
  description = "The name of the vSphere datacenter"
  type        = string
  default     = "Shednet"
}

variable "datastore" {
  description = "The name of the datastore"
  type        = string
  default     = "ds2"
}

variable "windows_template" {
  description = "The name of the Windows template"
  type        = string
  default     = "Windows2022Template"
}

variable "linux_template" {
  description = "The name of the Linux template"
  type        = string
  default     = "Ubuntu24_04Template"
}

variable "vm_count" {
  description = "Number of VMs to deploy"
  type        = number
  default     = 1
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "vm"
}

variable "network_name" {
  description = "The name of the network"
  type        = string
  default     = "VM Network"
}

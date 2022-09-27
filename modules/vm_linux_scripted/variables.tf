variable "vsphere_datacenter" {
  type        = string
  description = "(Required) The vSphere datacenter in which to create the virtual machine"
}

variable "vsphere_compute_cluster" {
  type        = string
  description = "(Required) vSphere compute cluster to use"
}

variable "vsphere_datastore" {
  type        = string
  description = "(Required) vSphere datastore to use"
}

variable "vsphere_network" {
  type        = string
  description = "(Required) vSphere network to use"
}

variable "vsphere_folder" {
  type        = string
  default     = ""
  description = "(Optional) The vsphere folder in which to place the virtual machine"
}

variable "hostname" {
  type        = string
  description = "(Required) The host name for this node"
}

variable "domain" {
  type        = string
  description = "(Required) Domain name for this node"
}

variable "node_num_cpus" {
  type        = number
  default     = 2
  description = "(Optional) Virtual CPUs to configure for this node"
}

variable "node_memory" {
  type        = number
  default     = 4096
  description = "(Optional) Memory in MB to configure for this node"
}

variable "root_volume_size" {
  type        = number
  default     = 40
  description = "(Required) The size of the root volume in gigabytes."
}

variable "disk_template" {
  type        = string
  description = "(Required) vSphere template to clone for this VM"
}
variable "vm_ip" {
  type        = string
  description = "(Required) IP Address of the new Virtual Machine"
}
variable "masklength" {
  type        = number
  default     = 24
  description = "(optional) Netmask length of the IP Subnet the VM will be on 24/16/etc"
}
variable "network_gateway_ip" {
  type        = string
  default     = ""
  description = "(Optional) IP Address of default gateway"
}
variable "dns_server_list" {
  type        = list(any)
  default     = [""]
  description = "(Optional) List of string for the DNS servers to use"
}

variable "script_name" {
  type        = string
  default     = ""
  description = "(Optional) Name of the script to run after the VM is up"
}

variable "script_user_name" {
  type        = string
  default     = ""
  description = "(Optional) User name to login and run script"
}

variable "script_user_password" {
  type        = string
  default     = ""
  description = "(Optional) Password to login and run script"
}

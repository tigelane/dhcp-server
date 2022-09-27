module "ps-lab-services-dhcp-01" {
  source = "./modules/vm_linux_scripted"

  vsphere_datacenter      = "dc1"
  vsphere_compute_cluster = "hx06"
  vsphere_datastore       = "hx06"

  # hostname can not contain '_'
  hostname         = "pslab-services-dhcp-01"
  domain           = "ps.labs.local"
  node_num_cpus    = 2
  node_memory      = 4096
  root_volume_size = 60
  disk_template    = "Templates/ubuntu-22.04-template"

  vsphere_network    = "hx06|ps-lab-core|services"
  vm_ip              = "10.89.129.245"
  masklength         = 24
  network_gateway_ip = "10.89.129.1"
  dns_server_list    = ["10.89.100.152", "10.89.100.153"]

  script_name          = "ps-lab-services-dhcp.sh"
  script_user_name     = "dv"
  script_user_password = var.script_user_password
}

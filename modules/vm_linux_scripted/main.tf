data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_compute_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.disk_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "node" {

  name             = var.hostname
  folder           = var.vsphere_folder
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = var.node_num_cpus
  memory   = var.node_memory
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    # eagerly_scrub    = true
    thin_provisioned = true
    size             = var.root_volume_size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.hostname
        domain    = var.domain
      }
      network_interface {
        ipv4_address = var.vm_ip
        ipv4_netmask = var.masklength
      }

      ipv4_gateway    = var.network_gateway_ip
      dns_server_list = var.dns_server_list
      dns_suffix_list = [var.domain]
    }
  }

  boot_delay = 10000
  # Remove existing SSH known hosts as remote identification (host key) changes between deployments.
  # Used only for running locally and here for historical purposes
  # provisioner "local-exec" {
  #   command = "ssh-keygen -R ${self.guest_ip_addresses[0]}"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /tmp/script.sh",
  #     "sudo /tmp/script.sh args",
  #   ]
  #   connection {
  #     type     = "ssh"
  #     user     = var.dns_user_name
  #     password = var.dns_user_password
  #     host     = self.guest_ip_addresses[0]
  #   }
  # }
}
resource "null_resource" "script_trigger" {
  triggers = {
    script_hash = filesha256(var.script_name)
  }
  connection {
    type     = "ssh"
    user     = var.script_user_name
    password = var.script_user_password
    host     = vsphere_virtual_machine.node.default_ip_address
  }

  provisioner "file" {
    source      = var.script_name
    destination = "/tmp/script.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh args",
    ]

  }
}

resource "ibm_pi_instance" "instance" {
  pi_cloud_instance_id  = ibm_pi_workspace.workspace.id
  pi_instance_name      = "pvs-${random_id.suffix.hex}"
  pi_image_id           = ibm_pi_image.image.image_id
  pi_sys_type           = "s922"
  pi_proc_type          = "shared"
  pi_processors         = 0.25
  pi_memory             = 2
  pi_network {
    network_id = ibm_pi_network.network.network_id
  }
  pi_key_pair_name      = ibm_pi_key.ssh.name
}

resource "ibm_pi_network" "network" {
  pi_cloud_instance_id = ibm_pi_workspace.workspace.id
  pi_network_name      = "network-${random_id.suffix.hex}"
  pi_network_type      = "pub-vlan"
}

resource "ibm_pi_key" "ssh" {
  pi_cloud_instance_id = ibm_pi_workspace.workspace.id
  pi_key_name = "key-${random_id.suffix.hex}"
  pi_ssh_key = var.ssh_pubkey
}

resource "ibm_pi_image" "image" {
  pi_cloud_instance_id = ibm_pi_workspace.workspace.id
  pi_image_id = var.stock_image_id
}

resource "ibm_resource_group" "group" {
  name = "power-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "ibm_pi_workspace" "workspace" {
  pi_name              = "workspace-${random_id.suffix.hex}"
  pi_datacenter        = var.region
  pi_resource_group_id = ibm_resource_group.group.id
}

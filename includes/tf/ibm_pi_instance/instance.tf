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

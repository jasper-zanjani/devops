resource "ibm_pi_instance" "pvs" {
  pi_cloud_instance_id  = var.workspace_id
  pi_instance_name      = "pvs-${random_id.suffix.hex}"
  pi_image_id           = var.image_id
  pi_sys_type           = "s922"
  pi_proc_type          = "shared"
  pi_processors         = 0.25
  pi_memory             = 2
  pi_network {
    network_id = ibm_pi_network.network.networkid
  }
} # (1)


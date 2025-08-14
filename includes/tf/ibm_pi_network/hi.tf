resource "ibm_pi_network" "network" {
  pi_cloud_instance_id = ibm_pi_workspace.workspace.id
  pi_network_name = "network-${random_id.suffix.hex}"
  pi_network_type = "pub-vlan"
} # (1)

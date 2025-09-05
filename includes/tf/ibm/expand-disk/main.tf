resource "ibm_pi_volume" "volume" {
    pi_cloud_instance_id = var.workspace_id
    pi_volume_name = var.volume_name
    pi_volume_size = 50
    pi_volume_shareable = false
}

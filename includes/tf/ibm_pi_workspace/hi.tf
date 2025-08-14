resource "ibm_pi_workspace" "power_workspace" {
  pi_name   = var.workspace_name
  pi_datacenter = var.region
  pi_resource_group_id = ibm_resource_group.group.id
}

resource "ibm_pi_workspace" "workspace" {
  pi_name = "workspace-${random_id.suffix.hex}"
  pi_datacenter = var.region
  pi_resource_group_id = ibm_resource_group.group.id
}

resource "ibm_resource_group" "group" {
  name = "power-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 2
}


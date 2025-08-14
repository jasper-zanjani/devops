resource "ibm_pi_network" "network" {
  pi_cloud_instance_id = ibm_pi_workspace.workspace.id
  pi_network_name = "network-${random_id.suffix.hex}"
  pi_network_type = "pub-vlan"
}

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

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  zone             = var.zone
}

terraform {
  required_providers {
    ibm = { source = "IBM-Cloud/ibm" }
  }
}

variable "ibmcloud_api_key" {}
variable "region" {}
variable "zone" {}

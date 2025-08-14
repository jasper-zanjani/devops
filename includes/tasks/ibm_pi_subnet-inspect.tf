output "vnet" {
  value = data.ibm_pi_network.network.id
}

data "ibm_pi_network" "network" {
  pi_network_name = "snet-cli"
  pi_cloud_instance_id = data.ibm_pi_workspace.workspace.id
}

data "ibm_pi_workspace" "workspace" {
  pi_cloud_instance_id = var.workspace_id
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = "us-south"
  zone = "dal10"
}

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "ibmcloud_api_key" {}
variable "workspace_id" {}


terraform {
    required_providers {
      ibm = {
         source = "IBM-Cloud/ibm"
      }
    }
}

variable "apikey" {}

provider "ibm" {
    ibmcloud_api_key = var.apikey
    region = "us-east"
    zone = "wdc06"
}

data "ibm_pi_workspaces" "workspaces" {
  pi_cloud_instance_id = "99fba9c9-66f9-99bc-9999-aca999ee9d9b"
}

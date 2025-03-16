terraform {
    required_providers {
        ibm = {
            source = "IBM-Cloud/ibm"
        }
    }
}

variable "ibmcloud_api_key" {}

provider "ibm" {
    ibmcloud_api_key = var.ibmcloud_api_key
    region = "us-east"
}

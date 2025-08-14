variable "aix_image_id" {}
variable "subnet_id" {}
variable "account_id" {}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "ibm_pi_instance" "pvs-vm" {
  pi_instance_name        = "pvs-${random_id.suffix.hex}"
  pi_cloud_instance_id    = var.account_id
  pi_image_id             = var.aix_image_id
  pi_sys_type             = "s922"
  pi_proc_type            = "shared"
  pi_processors           = 0.25
  pi_memory               = 2
  pi_network {
    network_id = var.subnet_id
  }
}

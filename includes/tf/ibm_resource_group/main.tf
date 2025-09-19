resource "ibm_resource_group" "group" {
  name    = "power-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 2
}


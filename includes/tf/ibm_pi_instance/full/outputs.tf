output "workspace_crn" {
  description = "Needed to set workspace target when using IBMCloud CLI"
  value = ibm_pi_workspace.workspace.crn
}

output "ip" {
  description = "Public IP address of Power Virtual Server instance"
  value = ibm_pi_instance.instance.pi_network[0].external_ip
}


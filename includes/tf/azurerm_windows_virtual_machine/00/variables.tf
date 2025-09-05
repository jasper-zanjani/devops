variable "azure_subscription_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "resource_group_name" {}
variable "project" {}
variable "environment" {
  validation {
    condition = length(var.environment) > 1
    error_message = "Environment must be defined as a single letter to follow resource naming conventions"
  }
}

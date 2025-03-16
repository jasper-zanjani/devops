terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">4"
    }
  }
}

variable "azure_subscription_id" {}

provider "azurerm" {
  subscription_id = var.azure_subscription_id
}

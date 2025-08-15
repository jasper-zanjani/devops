resource "azurerm_resource_group" "group" {
  name = "rg-${random_id.suffix.hex}"
  location = var.location
}

resource "random_id" "suffix" {
  byte_length = 2
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

terraform {
  required_providers {
    azurerm = { 
      source = "hashicorp/azurerm"
      version = "4.39"
    }
  }
}

output "group" {
  value = azurerm_resource_group.group.name
}

variable "subscription_id" {}
variable "location" {}


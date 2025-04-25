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
  features {}
}

resource "azurerm_resource_group" "rg-tf" {
  name = "rg-tf"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet-tf" {
  name = "vnet-tf"
  resource_group_name = azurerm_resource_group.rg-tf.name
  location = azurerm_resource_group.rg-tf.location
  address_space = ["10.0.0.0/16"]

  subnet {
    name = "sn0"
    address_prefixes = ["10.0.0.0/24"]
  }
  subnet {
    name = "sn1"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet {
    name = "sn2"
    address_prefixes = ["10.0.2.0/24"]
  }
}

output "group" {
  value = module.data.group
}

module "resource_group" {
  source = "./modules/resource_group"
  location = "centralus"
  subscription_id = var.subscription_id
}

module "data" {
  source = "./modules/data"
  subscription_id = var.subscription_id
  group = module.resource_group.group
}

variable "subscription_id" {}

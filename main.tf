terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "name" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

module "network" {
  source                                = "./modules/network"
  location                              = var.location
  azurerm_resource_group_name           = var.azurerm_resource_group_name
  azurerm_network_security_group_name   = var.azurerm_network_security_group_name
  azurerm_virtual_network_name          = var.azurerm_virtual_network_name
  azurerm_virtual_network_address_space = var.azurerm_virtual_network_address_space
  subnet_name                           = var.subnet_name
  subnet_prefix                         = var.subnet_prefix
  azurerm_public_ip_name                = var.azurerm_public_ip_name
  dns_label                             = var.dns_label
}

module "compute" {
  source         = "./modules/compute"
  location       = var.location
  subnet_id      = module.network.subnet_id
  vm_name        = var.vm_name
  vm_size        = var.vm_size
  public_ssh_key = var.public_ssh_key
}

module "storage" {
  source                      = "./modules/storage"
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location                    = var.location
}
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

module "network" {
  source                                = "./modules/network"
  location                              = var.location
  azurerm_resource_group_name           = var.azurerm_resource_group_name
  azurerm_network_security_group_name   = "defaultnsg"
  azurerm_virtual_network_name          = "vnet"
  azurerm_virtual_network_address_space = ["10.0.0.0/16"]
  subnet_name                           = "default"
  subnet_prefix                         = ["10.0.0.0/24"]
  azurerm_public_ip_name                = "linuxboxpip"
  dns_label                             = "matetask"
}

module "compute" {
  source         = "./modules/compute"
  location       = var.location
  subnet_id      = module.network.subnet_id
  vm_name        = "matebox"
  vm_size        = "Standard_B1s"
  public_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbaCyW7Alj8Jkw6OYyGvY5kymGutM8gKfLRWC9zFN+N5D1sQQudJE5xTtOh0lTJuYNdSfl5kqtP80mtSe3sh5ZTKktPyKd+12oR4zw7xSy7yzEUgf5uFr5yBAWeQo905PLAseXh0zwMX8Bs34mHVN65tkvYxzwTh/2Es5IIUF+QBvCh4dfUnv8r+PkNnmtT6GCXN9iw8zMbRnmOpp7CYikIqDwiuCxioRqcjMYKBipJ5CLw5wZYOy4BKJL7CF1hG8pgZUQAoYWhpdaICwqqtBInhyMk0vbRS4aeZRt7XP2MlkEtgwDB9haWiJUVXMkWwAWaYQJ0Ge46xen2xPjYjhdked+DDZGikXStejXOqp6YNn/61nc4t5SMAmvrajZvn7nfJPdDqLtLbTgxO/CINV6gHON058yBraZziDVEaq8O8XnkVS1l/fwz3Vwl3mnrGN/PYWIsaxJXhf+3Pm+UzSoUDsX1Ic3e47EgOZAKHJGVdHjIHjtsnHDpI/m2c2zxFqjfl3F4pe6q/+oH98rKSUtOf6Ba0MN+roBuJtCJCa7jdvlBLebvtPVYONk58E404BS1zpiw+snbW+JK0SZJvRXvrLDGHA1dYVVeKdnqC/tPd3eRUWICdi6blpGbTBaK17jdpXj7BLRpsQrHSXraCbFYi/32t+ZadfmLiBdXyCWoQ== tetianakolesnik@Tetianas-MBP"
}

module "storage" {
  source                      = "./modules/storage"
  azurerm_resource_group_name = var.azurerm_resource_group_name
  location                    = var.location
}
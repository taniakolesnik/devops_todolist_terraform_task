variable "azurerm_resource_group_name" {
  default = "mate-azure-task-12"
  type    = string
}

variable "location" {
  default = "uksouth"
  type    = string
}

variable "public_ssh_key" {
  type = string
}

variable "azurerm_network_security_group_name" {
  default = "defaultnsg"
  type    = string
}

variable "azurerm_virtual_network_name" {
  default = "vnet"
  type    = string
}

variable "azurerm_virtual_network_address_space" {
  default = ["10.0.0.0/16"]
  type    = list(string)
}

variable "subnet_name" {
  default = "default"
  type    = string
}

variable "subnet_prefix" {
  default = ["10.0.0.0/24"]
  type    = list(string)
}

variable "azurerm_public_ip_name" {
  default = "linuxboxpip"
  type    = string
}

variable "dns_label" {
  default = "matetask"
  type    = string
}

variable "vm_name" {
  default = "matebox"
  type    = string
}

variable "vm_size" {
  default = "Standard_B1s"
  type    = string
}
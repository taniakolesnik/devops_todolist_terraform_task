variable "azurerm_resource_group_name" {
  default = "mate-azure-task-12"
  type    = string
}

variable "location" {
  default = "uksouth"
  type    = string
}

variable "azurerm_storage_container_name" {
  default = "task-artifacts"
  type    = string
}
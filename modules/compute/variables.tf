variable "azurerm_resource_group_name" {
  description = "The name of the resource group"
  default     = "mate-azure-task-12"
  type        = string
}

variable "location" {
  description = "Resource location"
  default     = "uksouth"
  type        = string
}

variable "subnet_id" {
  description = "subnet id"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  default     = "matebox"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  default     = "Standard_B1s"
  type        = string
}

variable "public_ssh_key" {
  default     = "linuxboxsshkey"
  type        = string
  description = "SSH key"
}
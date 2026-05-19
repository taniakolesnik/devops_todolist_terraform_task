
# network security group
resource "azurerm_network_security_group" "example" {
  name                = var.azurerm_network_security_group_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
}

# virtual network
resource "azurerm_virtual_network" "example" {
  name                = var.azurerm_virtual_network_name
  location            = var.location
  resource_group_name = var.azurerm_resource_group_name
  address_space       = var.azurerm_virtual_network_address_space
}

# subnet
resource "azurerm_subnet" "default" {
  name                 = var.subnet_name
  resource_group_name  = var.azurerm_resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_prefix
}

# assosiate subnet to network security group
resource "azurerm_subnet_network_security_group_association" "default" {
  subnet_id                 = azurerm_subnet.default.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "random_integer" "dns" {
  min = 1000
  max = 9999
}

# public IP address
resource "azurerm_public_ip" "example" {
  name                = var.azurerm_public_ip_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.dns_label}${random_integer.dns.result}"
}
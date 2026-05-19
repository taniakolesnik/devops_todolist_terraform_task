output "subnet_id" {
  value = azurerm_subnet.default.id
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}

output "public_ip_fqdn" {
  value = azurerm_public_ip.example.fqdn
}
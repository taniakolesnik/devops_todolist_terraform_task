resource "azurerm_storage_account" "example" {
  name                     = "storageacctk19052026"
  resource_group_name      = var.azurerm_resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = var.azurerm_storage_container_name
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}
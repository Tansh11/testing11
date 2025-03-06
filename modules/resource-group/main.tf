resource "azurerm_resource_group" "identity_rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}

output "name" {
  value = azurerm_resource_group.identity_rg.name
}

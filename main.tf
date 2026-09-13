resource "azurerm_resource_group" "name" {
  name = var.resource_group_name
  location = var.location
  
}
resource "azurerm_user_assigned_identity" "example" {
  location            = var.location
  name                = "${var.identity_name}-${var.lifecycles}"
  resource_group_name = azurerm_resource_group.name.name
}

resource "azurerm_role_assignment" "roleA" {
  scope                = azurerm_resource_group.name.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.example.principal_id
}


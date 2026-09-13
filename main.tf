data "azurerm_resources" "example" {
  resource_group_name = "testRG"
}
resource "azurerm_user_assigned_identity" "example" {
  location            = var.location
  name                = "${var.identity_name}-${var.lifecycles}"
  resource_group_name = data.azurerm_resources.example.name
}

resource "azurerm_role_assignment" "roleA" {
  scope                = data.azurerm_resources.example.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.example.principal_id
}

